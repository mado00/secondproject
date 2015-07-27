class BooksmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
    @categoryBookmark = CategoryBookmark.all
  end

  def create
    @bookmark = Bookmark.create(bookmark_params)
      if @bookmark.save
        redirect_to user_index, notice: "Bookmark has been added"
      else
        render :new
  end

  def edit
    @categoryBookmark = CategoryBookmark.all
  end

  def update
  end

  private
    def bookmark_params
      params.require(:bookmark).permit(
        :name,
        :url,
        :user_id
        :categoryBookmark_id => [])
    end
end
