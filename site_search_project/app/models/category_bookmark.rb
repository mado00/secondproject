class CategoryBookmark < ActiveRecord::Base
	belongs_to :user
	has_many :favorites, dependent: :destroy
	# dependent: :destroy not functioning properly 
	has_many :bookmarks, through: :favorites
end
