class Fee < ActiveRecord::Base
  include Forwardable
  delegate :set_mayors_permit_fee, to: :mayors_permit_fees
  has_many :mayors_permit_fees
  has_many :business_fees
  has_many :businesses, through: :business_fees

  def set_fees
    self.set_mayors_permit_fee
    self.set_police_clearance_fee
    self.save
  end
  def set_mayors_permit_fee
    self.amount_of_fee_per_anum=50
  end

  def set_police_clearance_fee
    self.amount_of_fee_per_anum=50
  end
  end
