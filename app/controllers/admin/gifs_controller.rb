class Admin::GifsController < Admin::BaseController

def index
  @categories = Category.all
end

def new
  @categories = Category.all
end

def create
  # @category = Category.find_by(search_term: params[:search_term])
  # @gif = Gif.new(image_path: Giphy.random(@category.search_term).image_url.to_s, category_id: @category.id)
  if Category.find_by(search_term: params[:search_term])
    @category = Category.find_by(search_term: params[:search_term])
    search_term = @category.search_term
    @gif = Gif.create(image_path: Giphy.random(search_term).image_url.to_s, category_id: @category.id)
    redirect_to admin_gifs_path(anchor: @category.search_term)
  else
    flash.now[:info] = "New GIF must be from a category that has already been created."
    render :new
  end
end


def destroy
  @gif = Gif.find(params[:id])
  @gif.destroy
  redirect_to admin_gifs_path
end

end
