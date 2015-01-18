class FeesController < ApplicationController
before_filter :current_business, only: [:new, :create]

def new
  build_mayors_permit_fee
end
def create
  @business=Business.find(params[:business_id])
  @fee = @business.fees.build
 @fee. set_fees
end
private
def current_business
  @business = Business.find(params[:business_id])
end

def fee_params
  fee_params.permit(:amount_of_fee_per_anum)
end
end
