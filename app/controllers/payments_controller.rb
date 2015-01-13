class PaymentsController < ApplicationController
def new
  @payment = current_business.payments.build
end

def create
  @payment =current_business.payments.build(payment_params)
  if @payment.save
    redirect_to current_business, notice: 'payment successfully made'
  else
    render :new
  end
end

private
    def current_business
      @business=Business.find(params[:business_id])
    end

    def payment_params
      params.require(:payment).permit(:amount)
    end
end
