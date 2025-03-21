class ChangeUserReferenceInSubscribers < ActiveRecord::Migration[8.0]
  def change
    change_column_null :subscribers, :user_id, true
  end
end