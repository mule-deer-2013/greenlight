class AddIndexToVotes < ActiveRecord::Migration
  def up
    add_index(:votes, :voter_id)
  end

  def down
    remove_index(:votes, :voter_id)
  end

end
