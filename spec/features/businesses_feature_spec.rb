require 'rails_helper'

describe 'Businesses registrations' do
  let (:account) { create (:account_with_schema) }
  let (:user) { account.owner}
  let!(:taxpayer) { create(:taxpayer) }
    before do
      set_subdomain(account.subdomain)
      sign_user_in(user)
    end

    it "allows taxpayers to register a business" do
      taxpayer = create(:taxpayer)
      visit taxpayers_path
      click_link taxpayer.full_name
      click_button 'New Business'

      fill_in "Business name", with: 'Awesome Business'

      click_button "Register Business"
      expect(page).to have_text "Taxpayer registered successfully"
    end

    def click_show_taxpayer_button(taxpayer_full_name)
      within find("h3", text: taxpayer_full_name) do
      page.first("a").click
    end
  end
end

