class Message < ActiveRecord::Base
  attr_accessible :user_id, :reciever_id, :content
  belongs_to :user
  belongs_to :reciever, :class_name => "User"

end
