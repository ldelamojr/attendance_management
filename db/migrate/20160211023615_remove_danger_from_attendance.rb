class RemoveDangerFromAttendance < ActiveRecord::Migration
  def change
    remove_column :attendances, :danger, :boolean
  end
end
