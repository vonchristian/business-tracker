class Payment < ActiveRecord::Base
  belongs_to :taxpayer
  belongs_to :business
  has_many :taxes, through: :business
  validates :amount, presence: true, numericality: true
  def total
    subtotal - exemption + surcharge
  end
  def subtotal
   business_taxes + default_taxes
    #taxes + fees + gross_receipts_percentage - exemtions = surcharges
  end

  def exemption
    0
  end

   def surcharge
    0
  end

private
    def default_taxes
       Tax.default_taxes.sum(:amount)
     end

     def business_taxes
       taxes.sum(:amount)
     end

end
