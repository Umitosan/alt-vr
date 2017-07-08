require 'rails_helper'

describe 'realms path' do

  before(:each) do
    testAdmin = FactoryGirl.create(:user)
    testRealm1 = FactoryGirl.create(:realm)
    visit new_user_session_path
    fill_in 'Email', with: testAdmin.email
    fill_in 'Password', with: testAdmin.password
    click_button 'Log in'
    click_link 'Realms'
  end

  it 'shows all active realms' do
    testRealm2 = FactoryGirl.create(:realm)
    expect(page).to have_link(testRealm2.name)
  end

  it 'gives admins the option to add realms' do
    expect(page).to have_link("New realm")
  end

  it 'gives admins the option to edit realms' do
    expect(page).to have_link("Edit")
  end

  it 'gives admins the option to delete realms' do
    expect(page).to have_link("Delete")
  end

  it 'creates realms' do
    click_link 'New realm'
    fill_in 'realm_name', with: 'cyber cineplex'
    fill_in 'realm_description', with: 'the best there ever was'
    fill_in 'realm_price', with: 123.45
    fill_in 'realm_image_url', with: 'http://whattheheck.com'
    click_button 'Create Realm'
    expect(page).to have_content('cyber cineplex')
  end

  it 'destroys realms' do
    click_link 'Delete'
    expect(page).to have_content('deleted forever')
  end

end
