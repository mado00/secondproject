class Search < ActiveRecord::Base
	has_many :results, dependent: :destroy
	belongs_to :user
end
