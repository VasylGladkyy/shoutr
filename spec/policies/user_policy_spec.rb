require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

  subject { described_class }

  permissions :index? do
    it 'grant access' do
      expect(subject).to permit(admin)
    end

    it 'denied access' do
      expect(subject).not_to permit(user)
    end
  end

  permissions :show? do
    it 'grant access' do
      expect(subject).to permit(user)
      expect(subject).to permit(admin)
    end
  end

  permissions :create? do
    it 'grant access' do
      expect(subject).to permit(user)
      expect(subject).to permit(admin)
    end

    it 'denied access' do
      expect(subject).not_to permit(Guest.new)
    end
  end

  permissions :destroy? do
    it 'grant access' do
      expect(subject).to permit(user)
      expect(subject).to permit(admin)
    end

    it 'denied access' do
      expect(subject).not_to permit(Guest.new)
    end
  end
end
