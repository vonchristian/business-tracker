class Payment < ActiveRecord::Base
  belongs_to :taxpayer
  belongs_to :business
  has_many :taxes, through: :business
  before_save :set_amount
  def amount_to_pay
   business_taxes + default_taxes
    #taxes + fees + gross_receipts_percentage - exemtions = surcharges
  end
private
    def default_taxes
       Tax.default_taxes.sum(:amount)
     end

     def business_taxes
       taxes.sum(:amount)
     end
     def set_amount
      self.amount = self.amount_to_pay
    end

end
