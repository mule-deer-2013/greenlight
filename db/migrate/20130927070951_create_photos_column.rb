class CreatePhotosColumn < ActiveRecord::Migration
  def up
    add_column :users, :photo, :string
  end

  def down
    remove_column :users, :photo, :string
  end
end
