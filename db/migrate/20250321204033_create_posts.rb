class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.boolean :published
      t.datetime :published_at

      t.timestamps
    end
  end
end
