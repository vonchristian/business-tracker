require 'rails_helper'

RSpec.describe LineOfBusiness, :type => :model do

  describe 'associations' do
    it { should belong_to :business }
    it { should belong_to :business_nature }
  end
end

