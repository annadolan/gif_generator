class Admin::FavoritesController < Admin::BaseController

  def new

  end

  def create
    @gif = Gif.find(params[:gif_id])
    @favorite = Favorite.create(user_id: current_user.id, gif_id: @gif.id)
    redirect_to user_path(current_user)
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to user_path(current_user)
  end
end


end
