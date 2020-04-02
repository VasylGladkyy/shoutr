require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  before do
    @user = create(:user)
    @shout = create(:shout)
    sign_in_as(@user)
  end
  
  describe 'Post #create' do
    subject { post :create, { params: { id: @shout.id } } }
    
    it { is_expected.to have_http_status(:redirect) }
    it { is_expected.to redirect_to(root_path) }
  end
  
  describe 'Delete #destroy' do
    subject { delete :destroy, { params: { id: @shout.id } } }

    it { is_expected.to have_http_status(:redirect) }
    it { is_expected.to redirect_to(root_path) }
  end
end