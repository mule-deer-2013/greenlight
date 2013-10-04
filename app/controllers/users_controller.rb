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

     p "*1" * 30
      user = User.find(params[:id])
      user.update_attributes(longitude: params[:longitude], latitude: params[:latitude])
      render :json => current_user.to_json

  end

  def show
    p params
    user = User.find(params[:id])
    potentials = user.get_potentials_for_user
    p '*potentials'*20
    p potentials
    if potentials.empty?
      puts "no potentials"
      render :json => {:error => "no matches"}
    else
      votee = potentials.first
      user_data = { id: votee.id, name: votee.name, age: votee.age, sex: votee.sex, sexPreference: votee.sex_preference, photo: votee.photo.url, tagline: votee.tagline }
      # need to pass in the location of the user as well
      render :json => user_data.to_json
    end
  end


  def create
    user = User.new(name: params[:name], age: params[:age], sex: params[:sex], sex_preference: params[:sex_preference], email: params[:email], tagline: params[:tagline], photo: params[:photo])
    user.password = params[:password]

    if user.save
      login(user)
      render :json => current_user.to_json
    else
      render :json => ("false").to_json
    end

  end

  def new
   #should this go to sessions controller instead?
    @user = User.new
  end


  def new_message
    @message = ActsAsMessageable::Message.new
  end

  def show_message
    @to = User.find(params[:user_id])
    conversation = @to.received_messages

    render json: conversation.to_json
  end


  def create_message
    p "**************************************"
    p params[:content]['0']['value'].chomp

    @from = User.find(params[:user_id])
    @to = User.find(params[:receiver_id])
    @from.send_message(@to, params[:content]['0']['value'])
    conversation = @to.received_messages

    render json: conversation.to_json
  end

end



