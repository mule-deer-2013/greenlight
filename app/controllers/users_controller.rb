class UsersController < ApplicationController
  def index
    
  end

  def edit
    @user = User.new
  end

  def update
  	user = User.find(params[:id])
    user.update_attributes(sex_preference: params[:sex_preference], tagline: params[:tagline], sex: params[:sex])
  end

  def show
   	@user = User.find(params[:id])
  end

end


