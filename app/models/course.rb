class Course < ActiveRecord::Base
	has_many :users, through: :course_users
	has_many :attendance
end
