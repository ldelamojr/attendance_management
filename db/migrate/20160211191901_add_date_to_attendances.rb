class AddDateToAttendances < ActiveRecord::Migration
  def change
    add_column :attendances, :date, :date
  end
end
