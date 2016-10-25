class AddFavoriteToGif < ActiveRecord::Migration
  def change
    add_column :gifs, :favorite, :boolean
  end
end
