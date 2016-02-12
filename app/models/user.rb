class User < ActiveRecord::Base
	has_many :courses, through: :course_users
	has_many :attendance
	has_secure_password
end
