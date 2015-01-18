require 'rails_helper'

describe 'Payment ' do
  let (:account) { create (:account_with_schema) }
  let (:user) { account.owner}
    before do
      set_subdomain(account.subdomain)
      sign_user_in(user)
    end

it "registers payment of businesses" do
  business = create(:business)
  visit businesses_path
  click_link business.business_name.upcase
  click_link 'Pay Taxes'
  fill_in 'Amount', with: '100'
  fill_in 'Official receipt number', with: '09876 H'
      click_button "Register Payment"
      expect(page).to have_text "payment made successfully"
    end
end

