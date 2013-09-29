class UsersController < ApplicationController
  def index
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
    user.update_attributes(tagline: params[:user][:tagline])
    redirect_to user_path
  end

  def show
   	@user = User.find(params[:id])
    render :json => @user.to_json, :callback => params[:callback]
  end

  def create
    user = User.new(tagline: params[:tagline])
    user.save
    redirect_to user_path(user)
  end

  def new
    @user = User.new
  end

end



