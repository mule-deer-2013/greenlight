class MessagesController < ApplicationController
  def create
    p "*********************************************"
    message = Message.create(user_id: params[:user_id], reciever_id: params[:reciever_id], content: params[:content][8..-1])
    
    inbox_messages = (Message.where(user_id: params[:user_id], reciever_id: params[:reciever_id]) && Message.where(user_id: params[:reciever_id], reciever_id: params[:user_id]))
    p "HERES THE OBJECT"
    p inbox_messages
    render json: inbox_messages.to_json
  end

  def show 

  end

end
