class MessagesController < ApplicationController
  def create
    p "*********************************************"
    message = Message.create(sender_id: params[:sender_id], reciever_id: params[:reciever_id], content: params[:content][8..-1])
    

    render json: message.to_json
  end

  def show 

  end

end
