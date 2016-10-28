class GifsController < ApplicationController
  require 'giphy'

  before_action :require_login, only: [:index, :new, :create, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @gif = Gif.new

  end

  def show
    @gif = Gif.find(params[:id])
  end



  private

  def require_login
    unless session[:user_id]
      flash[:error] = "You must be logged in to do that!"
      redirect_to login_path
    end
  end

  # def require_admin
  #   if session[:user_id]
  #
  # end

end
