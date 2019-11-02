require 'rails_helper'

RSpec.describe "As a user" do
  context "When I visit a student show page" do
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
    @science = Course.create(
      name: "Science"
    )
    @luna_math = CourseStudent.create(
      course_id: @math.id,
      student_id: @luna_emmy.id,
      grade: 91.4
    )
    @luna_science = CourseStudent.create(
      course_id: @science.id,
      student_id: @luna_emmy.id,
      grade: 93.7
    )
    @zadin_math = CourseStudent.create(
      course_id: @math.id,
      student_id: @zadin_kai.id,
      grade: 96.8
    )
    end

    it "I see student information" do
      visit "/students/#{@luna_emmy.id}"
      expect(page).to have_content("Name: Luna Emmy")
      expect(page).to have_content("Course and Grade: Math, 91.4")
      expect(page).to have_content("Course and Grade: Science, 93.7")
    end
  end
end
