require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!
describe 'Taxpayer registrations', type: :feature do


  before (:each) do
   user = FactoryGirl.create(:user)
login_as(user, :scope => :user)
  end


  it "allows taxpayers to be registered" do
    visit taxpayers_path
    click_link "New Taxpayer"

    fill_in "First name", with: 'Von Christian'
    fill_in "Middle name", with: 'Pinosan'
    fill_in "Last name", with: 'Halip'
    fill_in "Email", with: 'itworks@example.com'
    fill_in "Mobile number", with: '09123456789'
    fill_in "TIN Number", with: '000-111-22223-55'
    fill_in "Cedula number", with: '1111'
    fill_in "Date Issued", with: '1/1/2014'
    fill_in "Place Issued", with: 'Tinoc'
    click_button "Register Taxpayer"

    expect(page).to have_text "registered successfully"
  end

  it "displays taxpayer validation messages" do
    visit taxpayers_path
    click_link "New Taxpayer"
    click_button "Register Taxpayer"
    expect(page).to have_text "can't be blank"
  end

  it "allows taxpayers to be edited" do
    visit taxpayers_path
    taxpayer = create(:taxpayer)
    click_link taxpayer.full_name
    click_link 'Edit Profile'
    fill_in "First name", with: 'Von Chris'
    click_button "Update Taxpayer"

    expect(page).to have_text "Taxpayer updated successfully"
  end

  it "displays an error for a missing taxpayer" do
    get :show, id: '/not-here'
    expect(response).to redirect_to(taxpayers_path)
    message = "The taxpayer you were looking for could not be found."
    expect(flash[:alert]).to eql(message)
  end

end

