class Favorite < ActiveRecord::Base
  belongs_to :category_bookmark
  belongs_to :bookmark
end
