require 'rails_helper'

describe 'Taxes creation' do
  let (:account) { create (:account_with_schema) }
  let (:user) { account.owner}
    before do
      set_subdomain(account.subdomain)
      sign_user_in(user)
    end

    it "allows user to create taxes" do
      visit taxes_path
      click_link 'New Tax'

      fill_in "Description", with: 'Business Fee'
      fill_in 'Amount', with: '100'

      click_button "Create Tax"
      expect(page).to have_text "created successfully"
    end

#     it 'allows user to edit taxes' do
#       tax = create(:tax)
#       visit taxes_path
#       click_tax_link tax.description

#       fill_in "Description", with: 'Business Fee2'
#     click_button "Update Tax"

#     expect(page).to have_text "updated successfully"
#   end
 end

def click_tax_link(tax_description)
    within find("td", text: tax_description) do
      page.first("a").click
  end
end
