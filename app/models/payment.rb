class Payment < ActiveRecord::Base
  attr_accessor :current_user
  enum status: [:paid, :unpaid]
  belongs_to :taxpayer
  belongs_to :business
  has_many :taxes, through: :business
  validates :official_receipt_number, presence: true, uniqueness: true
  before_save :set_status_to_paid
  before_save :set_amount_paid

  def total
    subtotal - exemption + surcharge
  end
  def subtotal
   fees + taxes
  end

def fees
 mayors_permit_fee
end

def taxes
  return tax_on_capital if self.business.gross_sales.blank?
  return tax_on_gross_sales if self.business.gross_sales
end
  def exemption
    0
  end

   def surcharge
    0
  end

  def mayors_permit_fee
    self.business.mayors_permit_fee_amount
  end

  def tax_on_capital
    self.business.capital_tax
  end
  def tax_on_gross_sales
    self.business.gross_sales_taxes_amount
  end

  private
  def set_status_to_paid
    self.status=:paid
  end
  def set_amount_paid
    self.amount=total
  end
end
