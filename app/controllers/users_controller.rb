class UsersController < ApplicationController

  def index
    randomUI = User.all.count
    user = User.find(rand(1..randomUI))
    photo = user.photo
    user_data = { id: user.id, name: user.name, age: user.age, sex: user.sex, sexPreference: user.sex_preference, photo_url: photo.url }
    render :json => user_data.to_json
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    #do i have to have if statement here?
    if current_user
      current_user.update_attributes(longitude: params[:longitude], latitude: params[:latitude])
      render :json => current_user.to_json
    else
      render :json => ("current_user does not exist").to_json
    end
  end

  def show
    p "******************************************"
    p params
    p current_user
    if logged_in?
      raise ArgumentError, "#show can only return a random user" unless params[:id] == "random"
      offset = rand(User.count)
      user = User.first(:offset => offset)
      user_data = { id: user.id, name: user.name, age: user.age, sex: user.sex, sexPreference: user.sex_preference, photo: user.photo.url }
      render :json => user_data.to_json
    else
      render :json => ("please log in").to_json
    end
  end

  def create
    user = User.new(name: params[:name], age: params[:age], sex: params[:sex], sex_preference: params[:sex_preference], email: params[:email], tagline: params[:tagline], photo: params[:photo])
    user.password = params[:password]
    p "*"*40
    p params

    p "FIRST SAVE BEFORE!!!!!!"
    if user.save
      p user
      p "FIRST SAVE AFTER!!!!!!"
      login(user)
      p current_user == user
      p logged_in?
      render :json => current_user.to_json
    else
      render :json => ("false").to_json
    end

  end

  def new
    #should this go to sessions controller instead?
    @user = User.new
  end

end



