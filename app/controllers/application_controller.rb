class ApplicationController < ActionController::Base
  before_filter :cors
  protect_from_forgery except: [:show, :create, :update, :destroy]

  helper_method :current_user, :logged_in?, :login, :logout

 def current_user
    current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.clear
  end

  def cors
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end
