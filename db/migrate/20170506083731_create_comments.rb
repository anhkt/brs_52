class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :review_id
      t.integer :user_id
      t.integer :parent_id

      t.timestamps
    end

    add_index :comments, :review_id
    add_index :comments, :user_id
    add_index :comments, :parent_id
  end
end
