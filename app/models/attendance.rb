class Attendance < ActiveRecord::Base
	belongs_to :courses
	belongs_to :users

	enum status: [:present, :late, :excused, :unexcused]
	# value is the index in array i.e. present = 0, late = 1 etc.
end
