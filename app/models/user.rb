class User < ActiveRecord::Base
	has_many :courses, through: :courses_user
	has_many :attendance
end
