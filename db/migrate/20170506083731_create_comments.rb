class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :review_id
      t.integer :user_id

      t.timestamps
    end

    add_index :comments, :review_id
    add_index :comments, :user_id
  end
end
