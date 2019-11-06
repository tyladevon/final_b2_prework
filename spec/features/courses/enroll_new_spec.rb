require 'rails_helper'

RSpec.describe "As a user" do
  context "When I visit a course show page" do
    before(:each) do
      @luna_emmy = Student.create(
        name: "Luna Emmy"
      )
      @zadin_kai = Student.create(
        name: "Zadin Kai"
      )
      @math = Course.create(
        name: "Math"
      )
      @luna_math = CourseStudent.create(
        course_id: @math.id,
        student_id: @luna_emmy.id,
        grade: 91.4
      )
      @zadin_math = CourseStudent.create(
        course_id: @math.id,
        student_id: @zadin_kai.id,
        grade: 96.8
      )
      visit "/courses/#{@math.id}"
    end

    it "I see a form to enroll a new student in this course" do
      fill_in :name, with: "Molly"
      click_on "Enroll"

      student = Student.last
      expect(current_path).to eq("/students/#{student.id}")
      expect(page).to have_content("Name: Molly")
      expect(page).to have_content("Course and Grade: Math, 0")
    end
  end
end
