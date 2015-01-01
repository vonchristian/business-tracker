require 'rails_helper'

RSpec.describe Tax, :type => :model do
  describe 'validations' do
    it { should validate_presence_of :description }
    it { should validate_presence_of :amount }
     it { should validate_numericality_of :amount }
  end

  describe 'associations' do
    it { should belong_to :business }
  end
end
