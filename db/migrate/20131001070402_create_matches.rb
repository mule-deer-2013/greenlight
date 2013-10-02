class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :user_id
      t.integer :pair_id
      t.string  :user_1_vote
      t.string  :user_2_vote
      t.string  :match_status, :default => "Pending"

      t.timestamps
    end
  end
end
