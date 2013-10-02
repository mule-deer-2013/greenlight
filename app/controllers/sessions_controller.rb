class SessionsController < ApplicationController

  def create
    # will this throw error if email is not in DB?
    user = User.find_by_email(params[:email])

    if user && user.authenticate!(params[:password])
      login(user)
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
