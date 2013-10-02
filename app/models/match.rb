class Match < ActiveRecord::Base
  attr_accessible :pair_id, :user_id, :user_1_vote, :user_2_vote, :match_status
  belongs_to :user
  belongs_to :pair, :class_name => 'User'  
end


