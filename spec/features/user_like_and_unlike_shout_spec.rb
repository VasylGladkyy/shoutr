require 'rails_helper'

feature 'User like and unlike shout' do
  let(:user) { create(:user) }
  let(:shout) { create(:shout) }

  scenario 'successfully' do
    sign_in_with(user.email, user.password)
    
    visit root_path

    fill_in "term", with: shout.content.body
    click_on "Search"
    expect(page).to have_css('.shout a', text: 'Like')
    
    find('.shout').find('a', text: 'Like').click
    
    fill_in "term", with: shout.content.body
    click_on "Search"
    expect(page).to have_css('.shout a', text: 'Unlike')

    find('.shout').find('a', text: 'Unlike').click

    fill_in "term", with: shout.content.body
    click_on "Search"
    expect(page).to have_css('.shout a', text: 'Like')
  end
end