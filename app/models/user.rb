class User < ActiveRecord::Base
	has_secure_password
	has_many :courses, through: :course_users
	has_many :attendance
end
