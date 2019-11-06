class CourseStudentsController < ApplicationController

  def create
    student = Student.create(student_params)
    if student.save
      CourseStudent.create(student_id: student.id, course_id: params[:course_id])
      redirect_to "/students/#{student.id}"
    end
  end

  def destroy
    course_student = CourseStudent.find_by(course_student_params)
    student = course_student.student
    course_student.destroy

    redirect_to "/students/#{student.id}"
  end

  private

  def student_params
    params.permit(:name)
  end

  def course_student_params
    params.permit(:course_id, :student_id)
  end

end
