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

      click_button "Register Business"
      expect(page).to have_text "registered successfully"
    end
end


