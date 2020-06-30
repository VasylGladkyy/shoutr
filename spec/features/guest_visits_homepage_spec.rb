require 'rails_helper'

feature 'Guest visits homepage' do
  let(:shout) { create(:shout) }

  scenario 'successfully' do
    visit root_path

    expect(page).to have_css('h1', text: 'Welcome to Shoutr')
    expect(page).to have_css('h3',
                             text: 'Twitter-like service called "Shoutr" where we\'ll create "Shouts" instead of "Tweets."')

    find('.guest-home__text').find('a', text: 'Sign in').click
    expect(page).to have_css('.sign-in')

    visit root_path
    find('.guest-home__text').find('a', text: 'Sign up').click
    expect(page).to have_css('.sign-up')
  end

  scenario 'unsuccessfully' do
    visit root_path
    expect(page).not_to have_css('.dashboard')
  end
end
