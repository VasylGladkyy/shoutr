require 'rails_helper'

RSpec.describe Shout, type: :model do
  let(:shout) { create(:shout) }

  it "be valid" do
    expect(shout).to be_valid
  end
end
