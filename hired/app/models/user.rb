# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  username        :string           default(""), not null
#  password_digest :string           default(""), not null
#  session_token   :integer          default(0), not null
#

class User < ApplicationRecord
  attr_reader :password

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, allow_nil: true, length:{ minimum: 6 }

  has_many :sessions,
    primary_key: :id, 
    foreign_key: :user_id,
    class_name: :Session
 
  def password=( pass )
    @password = pass
    self.password_digest = BCrypt::Password.create( pass )
  end

  def is_password?( pass )
    BCrypt::Password.new( self.password_digest ).is_password?( pass )
  end

  def self.find_by_credentials( uname, pass )
    user = User.find_by( username: uname )
    return nil if user.nil?
    return user if user.is_password?( pass )
    return nil
  end
end
