class AddLatLonToUsers < ActiveRecord::Migration
  def up
    add_column :users, :longitude, :float, default: 0
    add_column :users, :latitude, :float, default: 0
  end

  def down
  remove_column :users, :longitude
  remove_column :users, :latitude
  end
end
