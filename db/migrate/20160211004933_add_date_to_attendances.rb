class AddDateToAttendances < ActiveRecord::Migration
  def change
    add_column :attendances, :date, :datetime
  end
end
