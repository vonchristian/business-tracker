class MayorsPermitFeesController < ApplicationController
before_filter :current_business, only: [:new, :create]


  def new
    @mayors_permit_fee = current_business.mayors_permit_fee.build
  end

  def create
    @mayors_permit_fee = current_business.mayors_permit_fee.create!(mayors_permit_fee_params)
      @mayors_permit_fee.set_amount
      @mayors_permit_fee.save
  end

  private
      def mayors_permit_fee_params
        params.require(:mayors_permit_fee).permit(:amount )
      end

      def current_business
        @business = Business.find(params[:business_id])
      end
end
