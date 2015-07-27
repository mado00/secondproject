class CategoryBookmark < ActiveRecord::Base
	has_many :favorites, dependent: :destroy
	has_many :bookmarks, through: :favorites
end
