class ChangeStatusDefault < ActiveRecord::Migration
  def change
    change_column_default :attendances, :status, 'present'
  end
end