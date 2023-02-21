require 'rails_helper'

feature 'User signs in' do
  let(:user) { create(:user) }
  scenario 'with valid credentials' do
    visit(new_user_session_path)
    fill_in('Email', with: user.email)
    fill_in('Password', with: '12345678')
    click_on('Log in')

    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'with invalid credentials' do
  end
end

feature 'User signs out' do
  scenario 'redirects the user to the signin page' do
  end
end

