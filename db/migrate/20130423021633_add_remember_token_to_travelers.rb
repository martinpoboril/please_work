class AddRememberTokenToTravelers < ActiveRecord::Migration
  def change
    add_column :travelers, :remember_token, :string
    add_index  :travelers, :remember_token
  end
end