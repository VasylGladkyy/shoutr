require 'rails_helper'

RSpec.describe FollowingRelationship, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:follower).class_name('User').counter_cache(:followed_users_count) }
    it { is_expected.to belong_to(:followed_user).class_name('User').counter_cache(:followers_count) }
  end
end
