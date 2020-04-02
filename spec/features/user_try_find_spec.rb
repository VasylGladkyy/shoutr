require 'rails_helper'

feature 'UserTryFind' do
  let(:shout) { create(:shout) }
  
  scenario 'successfully' do
    visit root_path
    
    fill_in "term", with: shout.content.body
    click_on "Search"

    expect(page).to have_css 'h1', text: shout.content.body
    expect(page).to have_css '.shout'
  end
end