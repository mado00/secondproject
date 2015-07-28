class CategoryBookmarksController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categorybookmarks = CategoryBookmark.all
  end

  def new
    @categorybookmark = CategoryBookmark.new
    @bookmarks = Bookmark.all
  end

  def create
    @categorybookmark = CategoryBookmark.create(categorybookmark_params)
    if @categorybookmark.save
      redirect_to category_bookmarks_path
    else
      render :new
    end
  end

  def edit
    @bookmarks = Bookmark.all
  end

  def show
    @categorybookmark_bookmarks = @categorybookmark.bookmarks
  end

  def update
    @categorybookmark.update(categorybookmark_params)
    if @categorybookmark.save
      redirect_to category_bookmarks_path
    else
      render :edit
    end
  end

  def destroy
    @categorybookmark.destroy
    redirect_to category_bookmarks_path
  end

  private
    def set_category
      @categorybookmark = CategoryBookmark.find_by_id params[:id]
    end

    def categorybookmark_params
      params.require(:category_bookmark).permit(
        :name,
        :bookmark_id => [])
    end

end
