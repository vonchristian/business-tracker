class Fee::MayorsPermitFee < Fee
  def amount_of_fee_per_anum
    return manufaturers_importers_producers_mayors_permit_fee if business_is_a_manufacturers_importers_producers
    return wholesalers_retailers_dealers_mayors_permit_fee if business_is_a_wholesalers_retailers_dealers
    return other_businesses_mayors_permit_fee if business_is_a_other_businesses
  end

  def wholesalers_retailers_dealers_mayors_permit_fee
    return business.amount_of_fee_per_anum=600 if business_is_micro_industry?
    return business.amount_of_fee_per_anum=900 if business_is_cottage_industry?
    return business.amount_of_fee_per_anum=1_500 if small_industry?
    return business.amount_of_fee_per_anum=2_500 if medium_industry?
    return business.amount_of_fee_per_anum=3_500 if large_industry?
  end

   def other_businesses_mayors_permit_fee
    return business.amount_of_fee_per_anum=600 if business_is_micro_industry?
    return business.amount_of_fee_per_anum=900 if business_is_cottage_industry?
    return business.amount_of_fee_per_anum=1_500 if small_industry?
    return business.amount_of_fee_per_anum=2_500 if medium_industry?
    return business.amount_of_fee_per_anum=3_500 if large_industry?
  end

def business_is_a_manufacturers_importers_producers
    self.business.industry_type==:manufaturers_importers_producers
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
