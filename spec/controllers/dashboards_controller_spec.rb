require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do
  describe 'Get #show' do
    before do
      @user = create(:user)
      sign_in_as(@user)
    end
    
    subject { get :show }
    
    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template('show') }
  end
end