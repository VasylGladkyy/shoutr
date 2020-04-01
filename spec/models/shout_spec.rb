require 'rails_helper'

RSpec.describe Shout, type: :model do
  let(:shout) { create(:shout) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:content) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user) }
    
    it "be valid" do
      expect(shout).to be_valid
    end
  end
  
end
