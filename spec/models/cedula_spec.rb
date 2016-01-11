require 'rails_helper'

describe Cedula do
  describe 'validations' do
    it { should validate_presence_of(:cedula_number) }
    it { should validate_presence_of(:date_of_issue) }
    it { should validate_presence_of(:place_of_issue) }
  end

  describe 'associations' do
   it { should belong_to :taxpayer }
  end
end
