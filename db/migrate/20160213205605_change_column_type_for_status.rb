class ChangeColumnTypeForStatus < ActiveRecord::Migration
   def change
    remove_column :attendances, :status
    add_column :attendances, :status, :integer, default: 0
  end
end
