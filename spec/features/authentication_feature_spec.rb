require 'rails_helper'

describe 'user authentication' do
  let (:user) { build(:user) }

  it 'allows signin with valid credentials' do
    sign_user_in(user)
    expect(page).to have_content('Signed in successfully')
  end

     it 'does not allow signin with invalid credentials' do
      sign_user_in(user, password: 'wrong password')

      expect(page).to have_content('Unable to login.')
    end


  it 'allows user to sign out' do
    sign_user_in(user)
    click_link 'Sign out'
    expect(page).to have_content('Signed out successfully')
  end
end

def sign_user_in(user, opts={})
     visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with:  (opts[:password] || user.password)
    click_button 'Sign in'
end

