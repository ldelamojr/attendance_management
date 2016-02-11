class RemoveDangerFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :danger, :boolean
  end
end
