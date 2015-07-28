class User < ActiveRecord::Base
	has_many :searches, dependent: :destroy
end
