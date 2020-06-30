require 'rails_helper'

feature 'User follow and unfollow other user' do
  let(:user_one) { create(:user) }
  let(:user_two) { create(:user) }

  xscenario 'successfully' do
    sign_in_with(user_one.email, user_one.password)

    visit user_path(user_two)

    expect(page).to have_selector("input[type=submit][value='Follow']")
    click_button 'Follow'

    expect(page).to have_selector("input[type=submit][value='Unfollow']")
    click_button 'Unfollow'

    expect(page).to have_selector("input[type=submit][value='Follow']")
  end
end
