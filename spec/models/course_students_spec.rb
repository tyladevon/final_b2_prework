require 'rails_helper'

RSpec.describe CourseStudent do
  describe 'Relationships' do
    it {should belong_to :course}
    it {should belong_to :student}
  end
end
