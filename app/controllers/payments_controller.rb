class PaymentsController < ApplicationController
def index
   if params[:query].present?
      @payments = Payment.text_search(params[:query]).page(params[:page]).per_page(30)
    else
  @payments = Payment.order('created_at DESC').page(params[:page]).per_page(30)
end
end
def new
  unless current_business.registered?
  @payment = current_business.payments.build
  authorize @payment
end
end

def create
  @payment =current_business.payments.build(payment_params)
  authorize @payment
      @payment.collecting_officer= current_user.full_name
  if @payment.save
    @payment.business.update_payment_status

    redirect_to business_path(id: @payment.business_id), notice: 'Payment successfully made.'
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
