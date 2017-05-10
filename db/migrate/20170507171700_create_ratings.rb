class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :rating, default: 0
      t.integer :user_id
      t.integer :book_id
      t.integer :review_id

      t.timestamps
    end
    add_index :ratings, :user_id
    add_index :ratings, :book_id
    add_index :ratings, :review_id
  end
end
