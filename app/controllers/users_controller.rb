class UsersController < ApplicationController
  def index
    
  end

  def edit
    @user = User.new
  end

  def update
  	current_user.update_attribute(sex_preference: params[:sex_preference])
  	current_user.update_attribute(tag_line: params[:tag_line])
  end

  def show
   	@user = User.find(:id)
    render :json => @user.to_json, :callback => params[:callback]
  end

end


