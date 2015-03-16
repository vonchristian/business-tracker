require 'rails_helper'

RSpec.describe Business, :type => :model do

  describe "validations" do
    it { should validate_presence_of :industry_type }
    it { should validate_presence_of :business_name }
    it { should validate_presence_of :business_type }
    it { should validate_presence_of :address_barangay }
    it { should validate_presence_of :address_sitio }
    it { should validate_presence_of :address_municipality}
    it { should validate_presence_of :address_province }
    it { should validate_presence_of :asset_size }
    it { should validate_presence_of :no_of_employees }
    it { should validate_presence_of :type_of_organization }
  end
  describe 'asset size validations' do
     it do
       should validate_numericality_of(:asset_size).with_message('Invalid Amount')
     end
   end
  describe 'capital validations' do
    it do
      should validate_numericality_of(:capital).with_message('Invalid Amount')
   end
  end

  describe "associations" do
   # it { should belong_to :type_of_organization }
    it { should belong_to :taxpayer}
    it { should have_many :payments }
    it { should have_many :gross_sales_taxes }
    it { should have_many :mayors_permit_fees }
    it { should have_many :line_of_businesses }

  end

  describe 'Enterprise_scale' do
    it 'returns micro if asset size is less than 150_000' do
      business = create(:business,  asset_size: 15_000)
      expect(business.enterprise_scale).to eq('micro')
    end
    it 'returns micro if asset size is less than or equal to 150_000' do
      business = create(:business, asset_size: 150_000)
      expect(business.enterprise_scale).to eq('micro')
    end

     it 'returns cottage if asset size 150_001 to 1,500,000' do
      business = create(:business, asset_size: 150_001)
      expect(business.enterprise_scale).to eq('cottage')
    end

       it 'returns cottage if asset size 150_000 to 1,500,000' do
      business = create(:business, asset_size: 1_500_000)
      expect(business.enterprise_scale).to eq('cottage')
    end

     it 'returns small_scale if asset size 1_500_001 to 15_000,000' do
      business = create(:business, asset_size: 1_500_001)
      expect(business.enterprise_scale).to eq('small_scale')
    end

       it 'returns small_scale if asset size 1_500_000 to 15_000,000' do
      business = create(:business, asset_size: 15_000_000)
      expect(business.enterprise_scale).to eq('small_scale')
    end

      it 'returns medium if asset size 15_000_001 to 60_000,000' do
      business = create(:business, asset_size: 15_000_001)
      expect(business.enterprise_scale).to eq('medium')
    end

       it 'returns medium if asset size 15_000_000 to 60_000,000' do
      business = create(:business, asset_size: 60_000_000)
      expect(business.enterprise_scale).to eq('medium')
    end

      it 'returns large scale if asset size is greater 60_000,000' do
      business = create(:business, asset_size: 60_000_001)
      expect(business.enterprise_scale).to eq('large')
    end

       it 'returns large scale if asset size 15_000_000 to 60_000,000' do
      business = create(:business, asset_size: 100_000_000)
      expect(business.enterprise_scale).to eq('large')
    end
  end

   it "returns a business address as a string" do
    business = create(:business, address_street: 'Kamelbeng', address_barangay: 'Poblacion', address_municipality: 'Tinoc', address_province: 'Ifugao')
    expect(business.address).to eql("Kamelbeng, Poblacion, Tinoc, Ifugao")
  end
end
