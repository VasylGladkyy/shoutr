require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    @user = create(:user)
    @admin = create(:admin)
  end

  describe 'Get #index' do
    context 'if user not admin' do
      before do
        sign_in_as(@user)
      end

      subject { get :index }

      it { is_expected.to have_http_status(:redirect) }
      it { is_expected.to redirect_to(root_path) }
    end

    context 'if user admin' do
      before do
        sign_in_as(@admin)
      end

      subject { get :index }

      it { is_expected.to have_http_status(:success) }
      it { is_expected.to render_template('index') }
    end
  end

  describe 'Get #show' do
    before do
      sign_in_as(@user)
    end

    subject { get :show, params: { id: @user.username } }

    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template('show') }
  end
end
