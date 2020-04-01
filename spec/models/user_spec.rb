require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  
  describe "validation test's" do
    it "be valid" do
      expect(user).to be_valid
    end
    
    context "if not valid" do
      it "name is not present" do
        user.username = ""
        expect(user).not_to be_valid
      end
      
      it "name is not unique" do
        second_user = build(:user, username: user.username)
        expect(second_user).not_to be_valid
      end
      
      it "email is not present" do
        user.email = ""
        expect(user).not_to be_valid
      end
      
      it "email is not unique" do
        second_user = build(:user, email: user.email)
        expect(second_user).not_to be_valid
      end
      
      it "password is not present" do
        user.password = " "
        expect(user).not_to be_valid
      end
    end
  end
  
  describe "User interaction" do
    let(:first_user) { create(:user) }
    let(:second_user) { create(:user) }
    
    it "follow and unfollow a user" do
      expect(first_user.following?(second_user)).to be false
      first_user.follow(second_user)
      expect(first_user.following?(second_user)).to be true
      first_user.unfollow(second_user)
      expect(first_user.following?(second_user)).to be false
    end
    
    it "like and inlike user post" do
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
