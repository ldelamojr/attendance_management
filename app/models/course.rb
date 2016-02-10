class Course < ActiveRecord::Base
	has_many :users, through: :courses_user
	has_many :attendance
end
