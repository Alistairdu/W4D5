require 'spec_helper'
require 'rails_helper'

feature 'the signup process', type: :feature do
  scenario 'has a new user page' do 
    visit new_user_url
    # save_and_open_page
    expect(page).to have_content("Sign Up!") 
    expect(page).to have_content 'Username'
    expect(page).to have_content 'Password'   
  end

  feature 'signing up a user', type: :feature do
      before(:each) do
        create(:user)
      end

    scenario 'shows username on the homepage after signup' do 

      visit new_user_url
      # look for username and fill it out
      # also for password
      # look for a button called sign up
      # then tell it to click on it
      # redirect to user show page
      fill_in 'Username', with: 'Alistair_duPont'
      fill_in 'Password', with: 'puppies'
      click_button 'Sign up!'
      # User.create!(username: 'Alistair_duPont', password: 'puppies')
      # sign_in('Alistair_duPont')
      expect(page).to have_content 'Alistair_duPont'
      # expect(current_path).to eq(user[:id]) 
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do 
    visit new_session_url
    fill_in 'Username', with: 'Alistair_duPont'
    fill_in 'Password', with: 'puppies'
    click_button 'Sign in!'
    expect(page).to have_content 'Alistair_duPont'
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end