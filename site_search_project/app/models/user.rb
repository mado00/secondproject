class User < ActiveRecord::Base
	has_many :searches, dependent: :destroy
	has_many :bookmarks, dependent: :destroy
	has_many :category_bookmarks, dependent: :destroy

	has_secure_password
	validates :username, uniqueness: {case_sensitive: false}, presence: true

	def generate_password_reset_token!
		update(password_reset_token: SecureRandom.urlsafe_base64(48))
	end
end
