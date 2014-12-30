require 'rails_helper'

describe 'account creation' do
  it 'allows user to create account' do
    visit root_path
    click_link 'Create Account'

    fill_in 'First name', with: 'Von Christian'
    fill_in 'Last name', with: 'Halip'
    fill_in 'Email', with: 'vc.halip@gmail.com'
    fill_in 'Password', with: 'secretpassword'
    fill_in 'Password confirmation', with: 'secretpassword'
    fill_in 'Subdomain', with: 'tinoc'
    click_button 'Create Account'

    expect(page).to have_content('Signed up successfully.')
  end
end
