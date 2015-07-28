class Bookmark < ActiveRecord::Base
	belongs_to :user
	# has_many :favorites, dependent: :destroy
	# dependent: :destroy not functioning properly
	has_many :category_bookmarks, through: :favorites
end
