class AddDangerToUser < ActiveRecord::Migration
  def change
    add_column :users, :danger, :boolean, default: false
  end
end
