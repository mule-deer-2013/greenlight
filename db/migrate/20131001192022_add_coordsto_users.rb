class AddCoordstoUsers < ActiveRecord::Migration
  def up
    add_column :users, :longitude, :string
    add_column :users, :latitude, :string
  end

  def down
    remove_column :users, :longitude, :string
    remove_column :users, :latitude, :string
  end
end
