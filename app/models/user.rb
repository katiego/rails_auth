class User < ActiveRecord::Base
	has_secure_password
	validates :password, length: { in: 6..20, message: "must be between 6 and 20 chars" }
end
