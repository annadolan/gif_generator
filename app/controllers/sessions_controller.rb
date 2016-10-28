class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.authenticate(params[:password]) && @user.admin == true
      flash[:success] = "Successfully logged in as admin!"
      session[:user_id] = @user.id
      redirect_to admin_user_path(@user)
    elsif @user.authenticate(params[:password])
      flash[:success] = "Successfully logged in!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:warning] = "Incorrect password, please try again"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "You have successfully logged out!"
    redirect_to login_path
  end
end
