require 'rails_helper'
require 'support/features/clearance_helpers'

describe 'UserVisitsDashboardPage' do
  let(:user) { create(:user) }

  scenario 'successfully' do
    sign_in_with(user.email, user.password)

    visit root_path
    expect(page).to have_css('h1', text: 'Dashboard')
    expect(page).to have_css('.text-shout')
    expect(page).to have_css('.photo-shout')
  end

  scenario 'unsuccessfully' do
    visit root_path

    expect(page).not_to have_css('h1', text: 'Dashboard')
    expect(page).to have_css('h1', text: 'Welcome to Shoutr')
  end
end
