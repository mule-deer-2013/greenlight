class SessionsController < ApplicationController

  def create
    # will this throw error if email is not in DB?
    p "hellloooooooooo"
    p user = User.find_by_email(params[:email])
    p params[:password]
    #breaking here!!
    if user && user.authenticate(params[:password])
      p "user was authenticated"
      login(user)
      p session
      p "login worked"
      render :json => current_user.to_json
    else
      p "user was not authenticated"
      render :json => ('errorer').to_json
    end
  end

  def destroy
    logout
    render :json => ('logged out').to_json
  end

end
