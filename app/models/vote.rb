class Vote < ActiveRecord::Base
attr_accessible :voter_id, :voted_on_id, :opinion

has_and_belongs_to_many :users
end