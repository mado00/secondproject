class SessionsController < ApplicationController
  
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
      cookies[:user_id] = @user.id
  		redirect_to user_bookmarks_path(@user)
  	else
  		render :signup
  	end
  end

  def attempt_login
  	if params[:username].present? && params[:password].present?
  		found_user = User.where(username: params[:username]).first
  		if found_user && found_user.authenticate(params[:password])
  			session[:user_id] = found_user.id
        cookies[:user_id] = found_user.id
  			redirect_to user_bookmarks_path(found_user)

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
    cookies[:user_id] = nil
  	flash[:notice] = "Logged Out"
  	redirect_to login_path
  end

  def new_visit

    user = User.find_by_id(params[:user_id])
    existing_domain = false
    
    user.visits.each do |domain| 
      if domain.url == params[:url]
        existing_domain = domain
      end
    end

    if existing_domain
      time_amount_first = existing_domain.time_amount
      new_time_amount = params[:time_amount]

      num1 = time_amount_first.to_i
      num2 = new_time_amount.to_i

       total_time_amount = num1 += num2
        # visit = Visit.where(user_id: params[:user_id], url: params[:url])
        existing_domain.update(time_amount: total_time_amount)  
      else
        user.visits.create(url: params[:url], time_amount: params[:time_amount])
      end


    respond_to do |format|
      format.json { render :json => @site }
    end

  
end

  private

  def user_params
  	params.require(:user).permit(
  		:username,
  		:password
  		)
  end

end
