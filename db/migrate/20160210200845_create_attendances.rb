class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :status
      t.boolean :danger, default: false
      t.string :message
    end
  end
end
