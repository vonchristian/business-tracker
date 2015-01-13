class TypeOfOrganization < ActiveRecord::Base
  has_many :businesses
  enum ownership_type: [:sole_proprietorship, :partnership, :cooperative, :corporation, :incorporation, :religious]
end
