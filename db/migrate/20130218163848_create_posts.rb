class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.float :price
      t.integer :category_id
      t.string :location
      t.string :email
      t.string :contact_name
      t.timestamps
    end
  end
end
