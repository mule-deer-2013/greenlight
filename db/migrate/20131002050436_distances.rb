class Distances < ActiveRecord::Migration
  def change
    create_table :distances do |t|
      t.integer :user_id
      t.integer :stranger_id
      t.float :distance
    end
  end
end
