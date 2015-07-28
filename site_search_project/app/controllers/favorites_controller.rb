class FavoritesController < ApplicationController
 
  def home
    @favorites = Favorite.limit(6)
  end 

end
