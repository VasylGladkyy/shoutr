require 'rails_helper'

RSpec.describe FollowedUsersController, type: :controller do
  before do
    @user = create(:user)
    @user_to_follow = create(:user)
    sign_in_as(@user)
  end

  describe 'Post #create' do
    subject { post :create, { params: { id: @user_to_follow.username } } }

    it { is_expected.to have_http_status(:redirect) }
    it { is_expected.to redirect_to(@user_to_follow) }
  end

  describe 'Delete #destroy' do
    subject { post :destroy, { params: { id: @user_to_follow.username } } }

    it { is_expected.to have_http_status(:redirect) }
    it { is_expected.to redirect_to(@user_to_follow) }
  end
end
