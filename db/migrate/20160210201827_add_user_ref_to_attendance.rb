class AddUserRefToAttendance < ActiveRecord::Migration
  def change
    add_reference :attendances, :user, index: true, foreign_key: true
  end
end
