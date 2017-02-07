class CreateUserbooks < ActiveRecord::Migration[5.0]
  def change
    create_table :userbooks do |t|
      t.integer :status, default: 0
      t.boolean :favorite, default: false
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
