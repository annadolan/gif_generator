class UsersController < ApplicationController
  before_action :require_login, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save && logged_in?
      redirect_to user_path(current_user)
      flash[:success] = "New user created!"
    elsif @user.save && !logged_in?
      redirect_to login_path
      flash[:success] = "New user created! Please log in."
    elsif User.find_by(email: @user.email)
      redirect_to login_path
      flash[:error] = "User already exists, please log in"
    else
      flash.now[:error] = "Please fill in all fields before submitting new user"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :admin)
  end

  def require_login
    unless session[:user_id]
      flash[:error] = "You must be logged in to do that!"
      redirect_to login_path
    end
  end
end
