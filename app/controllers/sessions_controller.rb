class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      login user
      render :json => user.to_json
    else

      render :json => 'error'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

end
