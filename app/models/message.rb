class Message < ActiveRecord::Base
  attr_accessible :sender_id, :reciever_id, :content


end
