
class UsersController < ApplicationController
  before_filter :cors

  def index
    # randomUI = User.all.count
    # user = User.find(rand(1..randomUI))
    # photo = user.photo
    # user_data = { id: user.id, name: user.name, age: user.age, sex: user.sex, sexPreference: user.sex_preference, photo_url: photo.url }
    # render :json => user_data.to_json
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
    user.update_attributes(longitude: params[:longitude], latitude: params[:latitude])
    render :json => { :user => @user }
  end

  def show
    p params
    #current user that votes 
    user = User.find(params[:id])
    # raise ArgumentError, "#show can only return a random user" unless params[:id] == "random"
    # offset = rand(User.count)
    # user = User.first(:offset => offset)
    # psuedocode: write method that returns a user object according to the 
    # users sex and their sex_pref.  
    p "*******************************"
    p user
    potential = user.get_potentials_for_user
    p potential

    if potential == nil 
       render :json => "No matches"
    else
      potential.delete(user)
      random = rand(potential.count)
      votee = User.find(random) 
         
      user_data = { id: votee.id, name: votee.name, age: votee.age, sex: votee.sex, sexPreference: votee.sex_preference, photo: votee.photo.url }
      render :json => user_data.to_json
    end

  end

  def create
    user = User.new(name: params[:name], age: params[:age], sex: params[:sex], sex_preference: params[:sex_preference], email: params[:email], tagline: params[:tagline], photo: params[:photo])
    user.password = params[:password]
    p "user*"*20
    p user
    p "params*"*20
    p params


    if user.save
      login(user)
      #should i use user.to_json or current_user.to_json here?
      render :json => user.to_json
    else
      render :json => "false"
    end

  end

  def new
    #should this go to sessions controller instead?
    @user = User.new
  end

end



