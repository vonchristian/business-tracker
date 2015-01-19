class MayorsPermitFee < ActiveRecord::Base
  belongs_to :business
  before_save :set_amount

  def wholesalers_retailers_dealers_mayors_permit_fee
    self.amount=600 if business.micro?
    self.amount=900 if business.cottage?
    self.amount=1_500 if business.small_scale?
    self.amount=2_500 if business.medium?
    self.amount=3_500 if business.large?
  end

  def manufaturers_importers_producers_mayors_permit_fee
     self.amount=1_600 if business.micro?
     self.amount=2_000 if business.cottage?
     self.amount=2_500 if business.small_scale?
     self.amount=3_500 if business.medium?
     self.amount=4_500 if business.large?
  end

  def other_businesses_mayors_permit_fee
     self.amount=1_200 if business.micro?
     self.amount=1_400 if business.cottage?
     self.amount=1_800 if business.small_scale?
     self.amount=2_600 if business.medium?
     self.amount=3_000 if business.large?
  end


  def contractors_service_establishments_mayors_permit_fee
    self.amount=1_600 if business.micro?
    self.amount=1_800 if business.cottage?
    self.amount=2_000 if business.small_scale?
    self.amount=3_000 if business.medium?
    self.amount=4_500 if business.large?
  end

  def transloading_operations_mayors_permit_fee
    self.amount=3_000 if business.micro?
    self.amount=3_000 if business.cottage?
    self.amount=3_000 if business.small_scale?
    self.amount=3_000 if business.medium?
    self.amount=5_000 if business.large?
  end

  def other_financial_institutions_mayors_permit_fee
    self.amount=3_000 if business.micro?
    self.amount=3_000 if business.cottage?
    self.amount=3_000 if business.small_scale?
    self.amount=6_000 if business.medium?
    self.amount=8_000 if business.large?
  end

private
def set_amount
    return manufaturers_importers_producers_mayors_permit_fee if self.business.manufacturers_importers_producers?
    return wholesalers_retailers_dealers_mayors_permit_fee if self.business.wholesalers_retailers_dealers_distributors?
    return other_businesses_mayors_permit_fee if self.business.other_businesses?
    return other_financial_institutions_mayors_permit_fee if self.business.other_financial_institutions?
    return transloading_operations_mayors_permit_fee if self.business.transloading_operations?
    return contractors_service_establishments_mayors_permit_fee if self.business.contractors_service_establishments?
  end
end
