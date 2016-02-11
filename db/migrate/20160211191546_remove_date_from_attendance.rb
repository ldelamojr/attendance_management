class RemoveDateFromAttendance < ActiveRecord::Migration
  def change
    remove_column :attendances, :date, :datetime
  end
end
