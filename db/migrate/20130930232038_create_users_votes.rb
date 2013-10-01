class CreateUsersVotes < ActiveRecord::Migration
  def change
    create_table :users_votes do |t|
      t.belongs_to :user
      t.belongs_to :vote
    end
  end
end

