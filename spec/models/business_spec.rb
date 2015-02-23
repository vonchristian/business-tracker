require 'rails_helper'

RSpec.describe Business, :type => :model do

  describe "validations" do
   # it { should validate_presence_of :owner }
    it { should validate_presence_of :business_name }
   # it { should validate_presence_of :type_of_organization }
  end

  describe "associations" do
   # it { should belong_to :type_of_organization }
    it { should belong_to :taxpayer}
    it { should have_many :documents }
    it { should have_many :payments }
      it { should have_many :gross_sales_taxes }


  end

  describe 'enterprise_scale' do
    it 'returns micro if asset size is less than 150_000' do
      business = create(:business,  asset_size: 15_000)
      expect(business.enterprise_scale).to eq('micro')
    end
    it 'returns micro if asset size is less than or equal to 150_000' do
      business = create(:business, asset_size: 150_000)
      expect(business.enterprise_scale).to eq('micro')
    end

     it 'returns cottage if asset size 150_000 to 1,500,000' do
      business = create(:business, asset_size: 150_001)
      expect(business.enterprise_scale).to eq('cottage')
    end

       it 'returns cottage if asset size 150_000 to 1,500,000' do
      business = create(:business, asset_size: 1_500_000)
      expect(business.enterprise_scale).to eq('cottage')
    end

     it 'returns small_scale if asset size 1_500_000 to 15_000,000' do
      business = create(:business, asset_size: 1_500_001)
      expect(business.enterprise_scale).to eq('small_scale')
    end

       it 'returns small_scale if asset size 1_500_000 to 15_000,000' do
      business = create(:business, asset_size: 15_000_000)
      expect(business.enterprise_scale).to eq('small_scale')
    end

      it 'returns medium if asset size 15_000_000 to 60_000,000' do
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
end
