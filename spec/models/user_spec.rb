require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_one(:account) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:type) }
  end

  context 'Custom Method - full_name' do
    it 'should return first and last name as capitalized' do
      user = create(:user, first_name: "First", last_name: "Last")
      expect(user.full_name).to eq("First Last")
    end
  end
end
