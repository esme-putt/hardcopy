class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.integer :stock
      t.boolean :featured
      t.text :specifications
      t.string :condition
      t.decimal :original_price

      t.timestamps
    end
  end
end
