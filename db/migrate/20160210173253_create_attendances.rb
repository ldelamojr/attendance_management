class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :status, default: 0, index: true

      t.timestamps null: false
    end
  end
end
