class Fee < ActiveRecord::Base
  has_many :business_fees
  has_many :businesses, through: :business_fees

  def mayors_permit_fee
    return micro_industry_fees if self.business.micro_industry?
  end

  private
      def micro_industry?
        self.business.asset_size < 150_000
      end

      def micro_industry_fees
        0
      end
end
