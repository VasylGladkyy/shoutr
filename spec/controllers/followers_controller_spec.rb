require 'rails_helper'

RSpec.describe FollowersController, type: :controller do
  before do
    @user = create(:user)
    @shout = create(:shout)
    sign_in_as(@user)
  end

  describe 'Get #index' do
    subject { get :index, params: { user_id: @user.username } }

    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template('index') }
  end
end