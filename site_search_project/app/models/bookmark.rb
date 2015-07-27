class Bookmark < ActiveRecord::Base
	has_many :favorites, dependent: :destroy
	has_many :category_bookmarks, through: :favorites
end
