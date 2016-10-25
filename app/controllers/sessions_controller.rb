class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password_digest])

    unless @user.nil?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "Login failed"
      redirect_to login_path
    end
  end
end
