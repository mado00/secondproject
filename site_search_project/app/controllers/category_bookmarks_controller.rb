class CategoryBookmarksController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :new, :create]
  before_action :confirm_logged_in
  before_action :ensure_correct_user_for_category, only: [:edit, :update, :destroy]
  # Need to add the ability to only see your bookmarks and category bookmarks insure correct user
  
  def index
    @categorybookmarks = CategoryBookmark.all
  end

  def new
    @categorybookmark = CategoryBookmark.new
    @bookmarks = Bookmark.all
  end

  def create
    @categorybookmark = @user.category_bookmarks.create categorybookmark_params
    if @categorybookmark.save
      # Need to create a notice
      redirect_to user_category_bookmarks_path(@user), notice: "Category has been added"
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
      redirect_to user_category_bookmarks_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @categorybookmark.destroy
    redirect_to user_category_bookmarks_path(current_user)
  end

  private
    def set_category
      @categorybookmark = CategoryBookmark.find_by(id: params[:id])
    end

    def categorybookmark_params
      params.require(:category_bookmark).permit(
        :name,
        :bookmark_ids => []
        )
    end

    def set_user
      @user = User.find params[:user_id]
    end

    def ensure_correct_user_for_category
      categorybookmark = CategoryBookmark.find params[:id]
      unless categorybookmark.user.id == session[:user_id]
        redirect_to user_category_bookmarks_path(current_user), alert: "Not authorized"
    end
  end
end
