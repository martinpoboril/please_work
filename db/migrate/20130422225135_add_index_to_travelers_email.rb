class AddIndexToTravelersEmail < ActiveRecord::Migration
  def change
    add_index :travelers, :email, unique: true
  end
end
