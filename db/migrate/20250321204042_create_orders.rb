class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :email
      t.decimal :total_amount
      t.integer :status
      t.text :address
      t.string :phone

      t.timestamps
    end
  end
end
