class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :author
      t.text :description
      t.string :title
      t.string :image
      t.datetime :publish_date
      t.integer :number_of_pages
      t.integer :category_id
      t.float :rating, default: 0

      t.timestamps
    end

    add_index :books, :category_id
  end
end
