require 'rails_helper'

RSpec.describe Document, :type => :model do
  describe 'validations' do
    it { should validate_presence_of :description }
    it { should validate_presence_of :office }
  end

  describe 'associations' do
    it { should have_many :businesses }
  end
end
