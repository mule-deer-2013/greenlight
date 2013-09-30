class UsersController < ApplicationController
  before_filter :cors

  def index
    render :json => {:hey => "hello"}
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
    user.update_attributes(sex_preference: params[:sex_preference], tagline: params[:tagline], sex: params[:sex])
  end

  def show
   	@user = User.all.first
    render :json => { :user => @user } 
  end

  def create
    user = User.new(name: params[:name], age: params[:age], sex: params[:sex], sex_preference: params[:sex_preference], email: params[:email], tagline: params[:tagline])
    user.password = params[:password]

    if user.save
      render :json => user.to_json
    else

      render :json => "false"
    end

  end

  def new
    @user = User.new
  end

end



