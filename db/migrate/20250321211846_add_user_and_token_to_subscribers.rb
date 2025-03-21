class AddUserAndTokenToSubscribers < ActiveRecord::Migration[8.0]
  def change
    add_reference :subscribers, :user, null: false, foreign_key: true
    add_column :subscribers, :token, :string
  end
end
