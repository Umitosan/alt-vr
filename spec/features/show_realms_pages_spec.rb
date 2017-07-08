require 'rails_helper'

describe 'the realms path' do

  it 'shows all realms' do
    user = FactoryGirl.create(:user)
    realm = FactoryGirl.create(:realm)
    visit root_path
    click_link 'Sign in'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    click_link 'Realms'
    expect(page).to have_content(realm.name)
  end

end
