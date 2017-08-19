class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #This index renders registration
  def index
  	if current_user
  		redirect_to '/bright_ideas/'
  	end
  end

  def current_user
    return User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
