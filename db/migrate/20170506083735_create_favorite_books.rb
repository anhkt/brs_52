class CreateFavoriteBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_books do |t|
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end

    add_index :favorite_books, :user_id
    add_index :favorite_books, :book_id
  end
end
