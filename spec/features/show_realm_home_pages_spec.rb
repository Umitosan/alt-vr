require 'rails_helper'

describe 'the home page path' do

  before(:each) do
    visit root_path
  end

  it 'shows the sign up link' do
    expect(page).to have_link('Sign in')
  end

  it 'does not show sign out' do
    expect(page).not_to have_link('Sign out')
  end

end
