class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
      flash[:success] = "New category created!"
    else
      flash.now[:info] = "Category exists, please try again"
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.gifs.count == 0
      @category.destroy
      redirect_to admin_categories_path
      flash[:success] = "Category successfully deleted!"
    else
      redirect_to admin_categories_path
      flash[:danger] = "Category still has GIFs!"
    end
  end

  private

  def category_params
    params.require(:category).permit(:search_term)
  end
end
