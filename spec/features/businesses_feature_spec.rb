require 'rails_helper'

describe 'Business registrations', :type => :feature do

  before (:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

    it "allows registration of business" do
      taxpayer = create(:taxpayer)
      visit taxpayers_path
      click_link taxpayer.full_name
      click_link 'New Business'
      fill_in "Business name", with: 'Awesome Business'
      # fill_in "Type of business", with: 'New Business'
      fill_in "Asset size", with: 15_000
      fill_in "Number of Employees", with: 1
      fill_in "*Industry", with: "Wholesalers Retailers Dealers Distributors"
      fill_in "Type of Business", with: 'Retailers'
      fill_in "Application date", with: '2015-03-09'
      fill_in "Permit number", with: 294
      fill_in "Sitio", with: 'Tupaan'
      fill_in "Barangay", with: 'Poblacion'
      fill_in "Municipality", with: "Tinoc"
      fill_in "Province", with: "Ifugao"
      click_button "Register Business"
      expect(page).to have_text "registered successfully"
    end
end


