class AddDangerToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :danger, :boolean
  end
end
