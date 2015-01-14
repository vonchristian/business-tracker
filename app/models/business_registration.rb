class BusinessRegistration < ActiveRecord::Base
  belongs_to :taxpayer
  belongs_to :business

  accepts_nested_attributes_for :taxpayer
  accepts_nested_attributes_for :business
end
