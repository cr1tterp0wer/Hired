# == Schema Information
#
# Table name: sessions
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  session_token :integer          default(0), not null
#  user_id       :integer          default(0), not null
#

require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
