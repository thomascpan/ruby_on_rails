class User < ActiveRecord::Base
	validates :username, presence: true, uniqueness: { case_sensitive: false },
						length: { maximum: 20 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i							
	validates :email, presence: true, length: { maximum: 255 },
											format: { with: VALID_EMAIL_REGEX },
											uniqueness: { case_sensitive: false }
	has_many :posts			
	has_many :comments
end
