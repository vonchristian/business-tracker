class Payment < ActiveRecord::Base
  belongs_to :taxpayer
  belongs_to :business
  has_many :taxes
end
