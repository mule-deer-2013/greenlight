class CreateUsersVotes < ActiveRecord::Migration
  def change
    create_table :users_votes do |t|
      t.belongs_to :user
      t.belongs_to :vote
    end
  end
end

# User.find(richie.id).votes.where(voted_on_id: dude.id).first.opinion == User.find(dude.id).votes.where(voted_on_id: richie.id).first.opinion