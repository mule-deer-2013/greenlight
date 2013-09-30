class UsersController < ApplicationController
  before_filter :cors

  def index
    # @user = User.all.first # hard-coded, not restful
    # render :json => { :user => @user }  
  end

  def edit
    @user = User.new
  end

  def update
  	user = User.find(params[:id])
    user.update_attributes(sex_preference: params[:sex_preference], tagline: params[:tagline], sex: params[:sex])
  end

  def show
   	@user = User.all.first
    render :json => { :user => @user } 
  end

end


