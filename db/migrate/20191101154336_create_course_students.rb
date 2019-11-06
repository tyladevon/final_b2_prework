class CreateCourseStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :course_students do |t|
      t.references :course, foreign_key: true
      t.references :student, foreign_key: true
      t.float :grade, default: 0
      t.timestamp
    end
  end
end
