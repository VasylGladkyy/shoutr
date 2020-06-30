require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'associations' do
    it { is_expected.to have_many(:shouts).dependent(:destroy) }
    it { is_expected.to have_many(:likes) }
    it { is_expected.to have_many(:liked_shouts).through(:likes).source(:shout) }

    it do
      is_expected.to have_many(:followed_user_relationships)
        .with_foreign_key(:follower_id)
        .class_name('FollowingRelationship')
        .dependent(:destroy)
    end
    it { is_expected.to have_many(:followed_users).through(:followed_user_relationships) }

    it do
      is_expected.to have_many(:follower_relationships)
        .with_foreign_key(:followed_user_id)
        .class_name('FollowingRelationship')
        .dependent(:destroy)
    end
    it { is_expected.to have_many(:followers).through(:follower_relationships) }
  end

  describe "validation test's" do
    it 'be valid' do
      expect(user).to be_valid
    end

    context 'if not valid' do
      it 'name is not present' do
        user.username = ''
        expect(user).not_to be_valid
      end

      it 'name is not unique' do
        second_user = build(:user, username: user.username)
        expect(second_user).not_to be_valid
      end

      it 'email is not present' do
        user.email = ''
        expect(user).not_to be_valid
      end

      it 'email is not unique' do
        second_user = build(:user, email: user.email)
        expect(second_user).not_to be_valid
      end

      it 'password is not present' do
        user.password = ' '
        expect(user).not_to be_valid
      end
    end
  end

  describe 'User interaction' do
    let(:first_user) { create(:user) }
    let(:second_user) { create(:user) }

    it 'follow and unfollow a user' do
      expect(first_user.following?(second_user)).to be false
      first_user.follow(second_user)
      expect(first_user.following?(second_user)).to be true
      first_user.unfollow(second_user)
      expect(first_user.following?(second_user)).to be false
    end

    it 'like and inlike user post' do
      first_user.shouts << create(:shout)
      expect(first_user).to be_valid

      user_shout = first_user.shouts.first
      expect(user_shout).not_to be_nil
      expect(second_user.liked?(user_shout)).to be false

      second_user.like(user_shout)
      expect(second_user.liked?(user_shout)).to be true

      second_user.unlike(user_shout)
      expect(second_user.liked?(user_shout)).to be false
    end
  end
end
