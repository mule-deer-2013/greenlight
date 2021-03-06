class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :user_1
      t.integer :user_2
      t.string  :user_1_vote
      t.string  :user_2_vote
      t.string  :match_status, :default => "Pending"
    end
  end
end
