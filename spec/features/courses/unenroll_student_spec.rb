require 'rails_helper'

RSpec.describe "As a user" do
  context "When I visit a course show page" do
    before(:each) do
      @luna_emmy = Student.create(
        name: "Luna Emmy"
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

      visit "/courses/#{@math.id}"
    end

    it "I see a button 'unenroll' next to each student's name" do
      click_on 'unenroll'
      expect(current_path).to eq("/students/#{@luna_emmy.id}")
      expect(page).to have_content("Science")
      expect(page).to_not have_content("Math")
    end
  end
end
