class RemoveColumns < ActiveRecord::Migration
  def self.up
    remove_column :users, :photo
  end

  def self.down
    add_column :users, :photo, :string
  end
end
