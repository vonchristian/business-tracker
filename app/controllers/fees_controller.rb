class FeesController < ApplicationController

def create
  @business=Business.find(params[:business_id])
  @fee = @business.fees.create
 @fee. set_mayors_permit_fee
end

end
