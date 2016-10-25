class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
      flash[:success] = "New category created!"
    else
      flash.now[:error] = "Category exists, please try again"
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
    flash[:success] = "Category successfully deleted!"
  end

  private

  def category_params
    params.require(:category).permit(:search_term)
  end
end
