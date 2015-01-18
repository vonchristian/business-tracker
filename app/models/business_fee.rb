class BusinessFee < ActiveRecord::Base
  belongs_to :fee
  belongs_to :business
  has_many :mayors_permit_fees, through: :fee
end
