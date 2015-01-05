require 'rails_helper'

RSpec.describe BusinessNature, :type => :model do
  describe 'validations' do
    it { should validate_presence_of :description }
    it { should validate_presence_of :psic_code }
  end

  describe 'associations' do
    it { should have_many :businesses }
  end
end
