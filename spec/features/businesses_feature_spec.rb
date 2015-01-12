require 'rails_helper'

describe 'Businesses registrations' do
  let (:account) { create (:account_with_schema) }
  let (:user) { account.owner}
    before do
      set_subdomain(account.subdomain)
      sign_user_in(user)
    end

    it "allows registration of business" do
      visit businesses_path
      click_link 'New Business'

      fill_in "Business name", with: 'Awesome Business'
      fill_in "First name", with: 'Von'
      fill_in 'Middle name', with: 'Pinosan'
      fill_in 'Last name', with: 'Halip'
      fill_in 'Email', with: 'vc.halip@gmail.com'
      fill_in 'Mobile number', with: '09274173271'

      click_button "Register Business"
      expect(page).to have_text "registered successfully"
    end
end


