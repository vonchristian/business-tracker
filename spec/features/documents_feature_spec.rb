require 'rails_helper'

describe 'Documents creation' do
  let (:account) { create (:account_with_schema) }
  let (:user) { account.owner}
    before do
      set_subdomain(account.subdomain)
      sign_user_in(user)
    end

    it "allows user to create documents" do
      visit documents_path
      click_link 'New Document'

      fill_in "Description", with: 'Police Clearance'
      fill_in  "Office", with: 'Police Station'

      click_button "Create Document"
      expect(page).to have_text "created successfully"
    end

it "allows document to be edited" do
    document = create(:document)
    visit documents_path
    click_document_link document.description
    fill_in "Description", with: 'Barangay Clearance'
    click_button "Update Document"

    expect(page).to have_text "updated successfully"
  end
 end

 def click_document_link(document_description)
    within find("h3", text: document_description) do
      page.first("a").click
  end
end
