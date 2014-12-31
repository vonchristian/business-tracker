require 'rails_helper'

RSpec.describe Taxpayer, :type => :model do

  describe "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :middle_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :mobile_number }
    it { should validate_uniqueness_of :mobile_number }
  end

  describe "associations" do
    it { should have_many :businesses }
    #it { should have_many :payments }
    it { should have_one :address }
    #it { should have_many :businesses }


  end
end
