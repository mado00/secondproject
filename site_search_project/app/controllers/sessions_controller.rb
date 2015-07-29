class SessionsController < ApplicationController
  before_action :prevent_login_signup, only: [:signup, :create, :login, :attempt_login]
  before_action :confirm_logged_in, only: [:index]

  def index
  end

  def signup
  	@user = User.new
  end

  def login
  end

  def create
  	@user = User.create user_params
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to root_path
  	else
  		render :signup
  	end
  end

  def attempt_login
  	if params[:username].present? && params[:password].present?
  		found_user = User.where(username: params[:username]).first
  		if found_user && found_user.authenticate(params[:password])
  			session[:user_id] = found_user.id
  			redirect_to login_path
  		else
  			flash[:alert] = "username or password is invalid"
  			redirect_to login_path(@user)
  		end
  	else
  		flash[:alert] = "Please enter a username and password"
  		redirect_to login_path
  	end
  end

  def logout
  	session[:user_id] = nil
  	flash[:notice] = "Logged Out"
  	redirect_to login_path
  end

  private

  def user_params
  	params.require(:user).permit(
  		:username,
  		:password
  		)
  end

end
