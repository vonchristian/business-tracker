class Payment < ActiveRecord::Base
  enum status: [:paid, :unpaid]
  belongs_to :taxpayer
  belongs_to :business
  has_many :taxes, through: :business
  validates :official_receipt_number, presence: true, uniqueness: true
  after_save :set_status_to_paid
  before_save :set_amount_paid
  def total
    subtotal - exemption + surcharge
  end
  def subtotal
   fees + taxes
  end

def fees
  police_clearance_fee + mayors_permit_fee
end

def taxes
  tax_on_capital
end
  def exemption
    0
  end

   def surcharge
    0
  end
  def police_clearance_fee
    self.business.police_clearance_fee
  end
  def mayors_permit_fee
    self.business.mayors_permit_fees.last.amount
  end

  def tax_on_capital
    self.business.capital_investment_tax
  end
  def tax_on_gross_sales
    self.business.gross_sales_taxes.last.amount
  end

  private
  def set_status_to_paid
    self.status=:paid
  end
  def set_amount_paid
    self.amount=total
  end
end
