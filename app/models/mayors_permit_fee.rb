class MayorsPermitFee < ActiveRecord::Base
  belongs_to :business
  validates_presence_of :amount
  def set_amount(business)
    return manufaturers_importers_producers_mayors_permit_fee if self.business.manufacturers_importers_producers?
    return wholesalers_retailers_dealers_mayors_permit_fee if self.business.wholesalers_retailers_dealers_distributors?
    return other_businesses_mayors_permit_fee if self.business.other_businesses?
  end


  def wholesalers_retailers_dealers_mayors_permit_fee
    return self.amount=600 if business.micro?
    return self.amount=900 if business.cottage?
    return self.amount=1_500 if business.small?
    return self.amount=2_500 if business.medium?
    return self.amount=3_500 if business.large?
  end

  def manufaturers_importers_producers_mayors_permit_fee
    return self.amount=600 if business.micro?
    return self.amount=900 if business.cottage?
    return self.amount=1_500 if business.small?
    return self.amount=2_500 if business.medium?
    return self.amount=3_500 if business.large?
  end

  def other_businesses_mayors_permit_fee
     return self.amount=600 if business.micro?
    return self.amount=900 if business.cottage?
    return self.amount=1_500 if business.small?
    return self.amount=2_500 if business.medium?
    return self.amount=3_500 if business.large?
  end

end
