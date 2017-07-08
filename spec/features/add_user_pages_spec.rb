require 'rails_helper'

describe 'user creation' do

  it 'shows the user sign up form' do
    visit root_path
    click_link 'Sign up'
    expect(page).to have_content('Password confirmation')
  end

end
