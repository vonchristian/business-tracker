class TypeOfOrganization < ActiveRecord::Base
  has_many :businesses
  OWNERSHIP= ['Sole Proprietorship', 'Corporation']
end
