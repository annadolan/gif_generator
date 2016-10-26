class GifsController < ApplicationController
  require 'giphy'

  before_action :require_login, only: [:index, :new, :create, :destroy]

  def index
    @gifs = Gif.all
  end

  def new
    @gif = Gif.new
  end

  def show
    @gif = Gif.find(params[:id])
  end

  def create
    # @category = Category.find_by(search_term: params[:search_term])
    # @gif = Gif.new(image_path: Giphy.random(@category.search_term).image_url.to_s, category_id: @category.id)
    @category = Category.find_by(search_term: params[:search_term])
    search_term = @category.search_term
    @gif = Gif.create(image_path: Giphy.random(search_term).image_url.to_s, category_id: @category.id)
    redirect_to gif_path(@gif)
  end


  def destroy
    @gif = Gif.find(params[:id])
    @gif.destroy
    redirect_to gifs_path
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
