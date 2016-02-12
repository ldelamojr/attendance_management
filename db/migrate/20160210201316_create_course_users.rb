class CreateCourseUsers < ActiveRecord::Migration
  def change
    create_table :course_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
    end
  end
end