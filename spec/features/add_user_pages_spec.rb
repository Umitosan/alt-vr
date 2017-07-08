require 'rails_helper'

describe 'the user path' do

  it 'shows the user sign up form' do
    visit root_path
    click_link 'Sign up'
    expect(page).to have_content('Password confirmation')
  end

  it 'adds a user' do
    visit new_user_registration_path
    fill_in 'user_username', with: 'test_dude'
    fill_in 'user_email', with: 'test_dude@gmail.com'
    fill_in 'user_password', with: '1234567'
    fill_in 'user_password_confirmation', with: '1234567'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  it 'shows the sign in form' do
    visit root_path
    click_link 'Sign in'
    expect(page).to have_content('Log in')
  end

  it 'signs a user in' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign in'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    'cyber cineplex'
  end

end
