class UsersController < ApplicationController
  def index
    @user = User.first
    # render :json => @user.to_json, :callback => params[:callback]
  end

  def show
    @user = User.new
  end

  def create
   
  end

end


