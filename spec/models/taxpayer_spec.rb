require 'rails_helper'

RSpec.describe Taxpayer, :type => :model do

  describe "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :middle_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :cedula_number }
    it { should validate_presence_of :mobile_number }
    it { should validate_presence_of :cedula_date_issued }
    it { should validate_presence_of :cedula_place_issued }
  end

  describe 'attachments' do
    it { should have_attached_file(:photo) }
    it { should validate_attachment_content_type(:photo).
                allowing('image/png', 'image/gif', 'image/jpeg', 'image/jpg').
                rejecting('text/plain', 'text/xml') }
  end

  describe "associations" do
    it { should have_many :businesses }
    it { should have_one :police_clearance }
    it { should have_many :payments }
  end
  it "returns a taxpayer's full name as a string" do
    taxpayer = create(:taxpayer, first_name: 'Von', middle_name: 'Pinosan', last_name: 'Halip')
    expect(taxpayer.full_name).to eql("Halip, Von P.")
  end

  it "returns a taxpayer's first name and last name as a string" do
    taxpayer = create(:taxpayer, first_name: 'Von Christian', middle_name: 'P.', last_name: 'Halip')
    expect(taxpayer.first_and_last_name).to eql("Von Christian P. Halip")
  end

  it "returns a taxpayer's address as a string" do
    taxpayer = create(:taxpayer, address_street: 'Kamelbeng', address_barangay: 'Poblacion', address_municipality: 'Tinoc', address_province: 'Ifugao')
    expect(taxpayer.address).to eql("Kamelbeng, Poblacion, Tinoc, Ifugao")
  end
end
