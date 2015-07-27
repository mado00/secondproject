class Favorite < ActiveRecord::Base
  belongs_to :categoryBookmark
  belongs_to :bookmark
end
