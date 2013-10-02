class CreateDistanceTable < ActiveRecord::Migration
  def up
    create_table :distances do |t|
      t.integer :current_user_id
      t.integer :other_user_id
      t.integer :distance
    end
  end

  def down
  end
end
