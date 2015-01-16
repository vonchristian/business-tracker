class Fee < ActiveRecord::Base
  has_many :business_fees
  has_many :businesses, through: :business_fees

  def self.mayors_permit_fee(business)
    # return manufaturers_importers_producers_mayors_permit_fee if business==:manufacturers_importers_producers
    return wholesalers_retailers_dealers_mayors_permit_fee if business==:wholesalers_retailers_dealers
  end

  def wholesalers_retailers_dealers_mayors_permit_fee
    return business.mayors_permit_fee=600 if business_is_micro_industry?
    return business.mayors_permit_fee=900 if business_is_cottage_industry?
    return business.mayors_permit_fee=1_500 if small_industry?
    return business.mayors_permit_fee=2_500 if medium_industry?
    return business.mayors_permit_fee=3_500 if large_industry?
  end



  def business_is_micro_industry?
    self.business.enterprise_scale=:micro
  end

  def business_is_cottage_industry?
    self.business.enterprise_scale=:cottage
  end
  def business_is_small_industry?
    self.business.enterprise_scale=:small
  end
  def business_is_medium_industry?
    self.business.enterprise_scale=:medium
  end
  def business_is_large_industry?
    self.business.enterprise_scale=:large
  end
end
