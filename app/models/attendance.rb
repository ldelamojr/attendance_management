class Attendance < ActiveRecord::Base
	enum status: { "present"=>0, "late"=>1, "excused"=>2, "unexcused"=>3}
	belongs_to :courses
	belongs_to :users

	# AH HA!!
	# http://stackoverflow.com/questions/26002658/how-do-i-convert-a-date-before-saving-it-to-the-database-in-rails-4
	def date=(val)
      date = Date.strptime(val, "%m/%d/%Y") if val.present?
      write_attribute(:date, date)
    end

	# value is the index in array i.e. present = 0, late = 1 etc.
end
