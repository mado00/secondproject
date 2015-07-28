class CategoryBookmarksController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :new, :create]
  before_action :confirm_logged_in
  before_action :ensure_correct_user_for_category, only: [:edit, :update, :destroy]

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

    def set_user
      @user = User.find params[:user_id]
    end

    def ensure_correct_user_for_category
      categorybookmark = CategoryBookmark.find params[:id]
      unless categorybookmark.user.id == session[:user_id]
        redirect_to login_path, alert: "Not authorized"
    end
  end
end
