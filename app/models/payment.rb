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
   mayors_permit_fee + tax_on_capital
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

  def tax_on_capital
    self.business.capital_investment_tax
  end
  def tax_on_gross_sales
    self.business.gross_sales_taxes.last.amount
  end
end
