class AddFieldsToSession < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :session_token, :integer, default:0, null: false, uniqueness: true
    change_column_null :sessions, :session_token, false
    
    add_column :sessions, :user_id, :integer, default:0, null:false
    change_column_null :sessions, :user_id, false
  end
end
