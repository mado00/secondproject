 class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  before_action :confirm_logged_in
  before_action :set_categorybookmarks, only: [:show]
  before_action :set_user, only: [:new, :create]
  before_action :ensure_correct_user_for_bookmarks, only: [:edit, :update, :destroy]

  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
    @categorybookmarks = CategoryBookmark.all
  end

  def create
    @bookmark = @user.bookmarks.create bookmark_params
      if @bookmark.save
        redirect_to user_bookmarks_path(@user), notice: "Bookmark has been added"
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
      redirect_to user_bookmarks_path(@bookmark), notice: 'Bookmark has been Successfully Updated'
    else
      render :edit
    end
  end  


  def destroy
    @bookmark.destroy
    redirect_to user_bookmarks_path(current_user)
  end

  private
    def bookmark_params
      params.require(:bookmark).permit(
        :name,
        :url,
        :user_id,
        :category_bookmark_ids => []
        )
    end

    def set_bookmark
      @bookmark = Bookmark.find_by(id: params[:id])
    end

    def set_categorybookmarks
      @categorybookmark = CategoryBookmark.find_by_id params[:id]
    end

    def set_user
      @user = User.find params[:user_id]
    end

    def ensure_correct_user_for_bookmarks
      bookmark = Bookmark.find params[:id]
      unless bookmark.user.id == session[:user_id]
        redirect_to user_bookmarks_path(current_user)
      end
    end

end
