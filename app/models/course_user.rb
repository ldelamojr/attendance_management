class CourseUser < ActiveRecord::Base
	belongs_to :users
	belongs_to :courses
end