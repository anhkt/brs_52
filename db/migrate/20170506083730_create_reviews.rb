class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.integer :book_id
      t.integer :user_id

      t.timestamps
    end

    add_index :reviews, :book_id
    add_index :reviews, :user_id
  end
end
