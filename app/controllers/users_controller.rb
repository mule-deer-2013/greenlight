class UsersController < ApplicationController
  def index
    
  end

  def edit
    @user = User.new
  end

  def update
  	user = User.find(params[:id])
    user.update_attributes(sex_preference: params[:sex_preference, tagline: params[:tagline], sex: params[:sex])
    render :json => user.to_json, :callback => params[:callback]
  end

  def show
   	@user = User.find(params[:id])
    render :json => @user.to_json, :callback => params[:callback]
  end

end


