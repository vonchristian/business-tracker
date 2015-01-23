class PaymentsController < ApplicationController
def index
  @payments = Payment.all
end
def new
  unless current_business.registered?
  @payment = current_business.payments.build
end
end

def create
  @payment =current_business.payments.build(payment_params)
  @payment.business.update_payment
  if @payment.save
    redirect_to businesses_path, notice: 'payment successfully made'
  else
    render :new
  end
end

private
    def current_business
      @business=Business.find(params[:business_id])
    end

    def payment_params
      params.require(:payment).permit(:amount, :official_receipt_number)
    end
end
