class Payment < ActiveRecord::Base
  belongs_to :taxpayer
  belongs_to :business
  has_many :taxes, through: :business
  validates :amount,  numericality: true
  validates :official_receipt_number, presence: true
  def total
    subtotal - exemption + surcharge
  end
  def subtotal
   business_fees
  end

  def exemption
    0
  end

   def surcharge
    0
  end
  def mayors_permit_fee
    self.business.mayors_permit_fees.last.amount
  end

private

     def business_fees
       mayors_permit_fee
     end

end
