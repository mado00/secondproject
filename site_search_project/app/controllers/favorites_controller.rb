class FavoritesController < ApplicationController
 
  def home
    @favorites = Favorite.limit(24)
    @searches = Search.all
  end

end
