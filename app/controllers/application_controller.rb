class ApplicationController < ActionController::Base
  protect_from_forgery except: [:show, :create, :update]

  helper_method :current_user, :logged_in?, :login, :logout, :authenticate!

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.clear
    flash[:notice] = "You have successfully logged out."
  end

  def cors
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  def authenticate!(password)
    #set status to :unauthorized (401) unless logged_in?
  end

end
