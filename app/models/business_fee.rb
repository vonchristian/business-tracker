class BusinessFee < ActiveRecord::Base
  belongs_to :fee
  belongs_to :business

  def fees
    return micro_industry_fees_for_manufaturers_producers_importers if self.business.micro_industry?
  end

  def micro_industry_fees_for_manufaturers_producers_importers
    10
  end
end
