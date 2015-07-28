class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  before_action :confirm_logged_in
  before_action :set_categorybookmarks, only: [:show]

  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
    @categorybookmarks = CategoryBookmark.all
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
    @categorybookmarks = CategoryBookmark.all
  end

  def show
    @bookmark_categorybookmarks = @bookmark.category_bookmarks
  end


  def update
    @bookmark.update(bookmark_params)
    if @bookmark.save
      redirect_to bookmark_path(@bookmark), notice: 'Superhero has been Successfully Updated'
    else
      render :edit
    end
  end  


  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path
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

    def set_categorybookmarks
      @categorybookmark = CategoryBookmark.find_by_id params[:id]
    end

end
