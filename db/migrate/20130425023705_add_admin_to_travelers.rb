class AddAdminToTravelers < ActiveRecord::Migration
  def change
    add_column :travelers, :admin, :boolean, default: false
  end
end
