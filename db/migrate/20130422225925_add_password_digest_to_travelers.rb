class AddPasswordDigestToTravelers < ActiveRecord::Migration
  def change
    add_column :travelers, :password_digest, :string
  end
end
