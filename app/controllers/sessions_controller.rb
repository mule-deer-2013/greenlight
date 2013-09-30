class SessionsController < ApplicationController
  def create
    user = User.find_by_username(params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      login user  
      redirect_to user
    else
      # Create an error message and re-render the signin form 
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

end
