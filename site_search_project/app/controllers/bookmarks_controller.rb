class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

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
        redirect_to bookmarks_path, notice: "Bookmark has been added"
      else
        render :new
      end
  end

  def edit
    @categorybookmark = CategoryBookmark.all
  end

  def show
    @bookmark_categorybookmarks = @bookmark.categorybookmarks
  end


  def update
    # @bookmark.update(bookmark_params)
    # if @bookmark.save
    #   redirect_to bookmark_path(@bookmark), notice "Bookmark has been updated"
    # else
    #   render :edit
    # end
  end

  def destroy
    @bookmark.destroy
    redirect_to booksmark_path
  end

  private
    def bookmark_params
      params.require(:bookmark).permit(
        :name,
        :url,
        :user_id,
        :categoryBookmark_id => [])
    end

    def set_bookmark
      @bookmark = Bookmark.find_by(id: params[:id])
    end

end
