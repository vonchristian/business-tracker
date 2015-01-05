require 'rails_helper'

describe 'Payment of taxes' do
  let (:account) { create (:account_with_schema) }
  let (:user) { account.owner}
  let!(:taxpayer) { create(:taxpayer) }
    before do
      set_subdomain(account.subdomain)
      sign_user_in(user)
    end

it "allows taxpayer to pay taxes" do
  taxpayer = create(:taxpayer)
  visit taxpayers_path
  click_link taxpayer.full_name
  click_link 'Pay Taxes'
  fill_in 'Amount', with: '100'

      click_button "Pay Tax"
      expect(page).to have_text "payment made successfully"
    end
end
def click_show_taxpayer_link(taxpayer_full_name)
      within find("h3", text: taxpayer_full_name) do
      page.first("a").click
    end
  end
