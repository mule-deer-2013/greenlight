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
    respond_to do |format|
      format.json { render json: @user }
    end
    # render :json => @user.to_json, :callback => params[:callback]

  end

  def create
    user = User.new(name: params[:name], age: params[:age], sex: params[:sex], sex_preference: params[:sex_preference], email: params[:email], tagline: params[:tagline])
    user.password = params[:password]

    if user.save
      #login(user)
      # redirect_to user_path(user)
      # render :json => @user.to_json, :callback => params[:callback]
      # { "name": "Jeff Donios",
      #   "age": "25",
      #   "sex":"M",
      #   "sex_preference": "women",
      #   "email": "test@test.com",
      #   "tagline": "i am batman",
      #   "success": "true"
      # }
      render :json => "success"
    else
      #flash[:notice] = @user.errors.full_messages 
      # how can we show errors on front-end without erb?
      # send flash[:notice] as a JSON object maybe 
      #redirect_to new_user_path 
      render :json => "false"
    end

  end

  def new
    @user = User.new
  end

end



