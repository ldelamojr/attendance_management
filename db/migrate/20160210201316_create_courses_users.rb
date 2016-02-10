class CreateCoursesUsers < ActiveRecord::Migration
  def change
    create_table :courses_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
    end
  end
end
