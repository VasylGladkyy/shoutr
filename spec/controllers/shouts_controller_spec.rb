require 'rails_helper'

RSpec.describe ShoutsController, type: :controller do
  before do
    @user = create(:user)
    @shout = create(:shout)
    sign_in_as(@user)
  end

  describe 'Get #show' do
    subject { get :show, params: { id: @shout.id } }

    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template('show') }
  end
end
