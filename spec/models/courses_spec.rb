require 'rails_helper'

RSpec.describe Course do
  describe 'Relationships' do
    it {should have_many :course_students}
    it {should have_many(:students).through(:course_students)}
  end

  describe 'Validations' do
    it {should validate_presence_of :name}
  end
end
