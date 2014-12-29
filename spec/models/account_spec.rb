require 'rails_helper'

RSpec.describe Account, :type => :model do
  describe 'validations' do
  	it { should  validate_presence_of :owner }
  end
end
