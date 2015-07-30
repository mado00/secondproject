class FavoritesController < ApplicationController
 
  def home
    @favorites = Favorite.limit(6)
    @searches = Search.all
  end


end
