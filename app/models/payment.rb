class Payment < ActiveRecord::Base
  belongs_to :taxpayer
  belongs_to :business
  has_many :taxes, through: :business

  def amount_to_pay
    taxes
    #taxes + fees + gross_receipts_percentage - exemtions = surcharges
  end

  def taxes
    default_taxes + additional_taxes
  end

  def gross_receipts_percentage
  end

  private
      def default_taxes
        Tax.default_taxes.sum(:amount)
      end

      def additional_taxes
        self.business.taxes.sum(:amount)
      end

end
