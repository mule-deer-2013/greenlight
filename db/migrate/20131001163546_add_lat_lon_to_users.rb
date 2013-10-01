class AddLatLonToUsers < ActiveRecord::Migration
  def up
    add_column :users, :longtitude, :integer
    add_column :users, :latitude, :integer
  end

  def down
  remove_column :users, :longtitude, :integer
  remove_column :users, :latitude, :integer
  end
end
