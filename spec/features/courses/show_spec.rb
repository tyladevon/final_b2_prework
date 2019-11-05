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
      visit "/courses/#{@math.id}"
    end

    it "I see course information" do
      expect(page).to have_content(@math.name)
    end

    it "I can see students in each course in order of highest to lowest grades" do
      expect(page.all('.student-info')[0]).to have_content(@zadin_kai.name)
      expect(page.all('.student-info')[1]).to have_content(@luna_emmy.name)
    end
  end
end
