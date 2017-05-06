class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.integer :object_id
      t.integer :object_type
      t.integer :action_type
      t.integer :user_id

      t.timestamps
    end

    add_index :activities, :user_id
  end
end
