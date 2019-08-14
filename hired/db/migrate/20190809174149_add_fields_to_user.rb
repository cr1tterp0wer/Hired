class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string, default:"", null:false, uniqueness: true
    change_column_null :users, :username, false

    add_column :users, :password_digest, :string, default:"", null:false
    change_column_null :users, :password_digest, false

    add_column :users, :session_token, :integer, default:0, null:false, uniqueness:true
    change_column_null :users, :session_token, false
  end
end
