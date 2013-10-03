class MessagesController < ApplicationController
before_filter :cors
	
def index
    @messages = current_user.received_messages
  end

  def outbox
    @messages = current_user.sent_messages
  end

  def show
    @message = current_user.messages.find(params[:id])
  end

  def destroy
    @message = current_user.messages.find(params[:id])
    if @message.destroy
      flash[:notice] = "All ok"
    else
      flash[:error] = "Fail"
    end
  end

  def new
    @message = ActsAsMessageable::Message.new
  end

  def create
    @to = User.find_by_email(params[:message][:to])
    vote_objects = current_user.send_message(@to, params[:message][:topic], params[:message][:body])
    p "MESSAGEING ***********************************"
    p vote_objects
    render json: vote_objects.to_json
  end
end