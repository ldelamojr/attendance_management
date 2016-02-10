class AddCourseRefToAttendance < ActiveRecord::Migration
  def change
    add_reference :attendances, :course, index: true, foreign_key: true
  end
end
