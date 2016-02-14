class Attendance < ActiveRecord::Base
	enum status: { "present"=>0, "late"=>1, "excused"=>2, "unexcused"=>3}
	belongs_to :courses
	belongs_to :users

	# value is the index in array i.e. present = 0, late = 1 etc.
end
