class RemoveFavoriteFromGifs < ActiveRecord::Migration
  def change
    remove_column :gifs, :favorite, :boolean
  end
end
