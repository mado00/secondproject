class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user

  def confirm_logged_in
  	unless session[:user_id]
  		redirect_to login_path, alert: "Please Login"	
  	end
  end

  def confirm_admin
  	unless current_user.is_admin
  		redirect_to home_path, alert: "You must be an Admininstrater"
  	end
  end

  # Stop a logged in user from going to the sign up page
  def prevent_login_signup
  	if session[:user_id]
  		redirect_to :back, notice: "You are logged in"
  	end
  end

  def current_user
  	return unless session[:user_id]
  		# Will define @current_user if it its not already defined
  		@current_user ||= User.find_by_id(session[:user_id])
  	end
  		helper_method :current_user
  end

