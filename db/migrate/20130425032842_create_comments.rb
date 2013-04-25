class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.date :date_trip
      t.string :place
      t.integer :people
      t.string :transport
      t.string :feelings
      t.integer :user_id

      t.timestamps
    end
	add_index :comments, [:user_id, :created_at]
  end
end
