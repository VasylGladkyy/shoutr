require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  let(:shout) { create(:shout) }

  describe 'Get #show' do
    subject { get :show, params: { search: { term: shout.content.body } } }

    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template('show') }
  end
end
