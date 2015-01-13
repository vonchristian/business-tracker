class PaymentsController < ApplicationController
  before_filter :set_business, only: [:new, :create]
def new
  @payment = Payment.new
end

def create
  @payment = Payment.create(payment_params)
  if @payment.save
    redirect_to :back, notice: 'payment successfully made'
  else
    render :new
  end
end

private
    def set_business
      @business=Business.find(params[:business_id])
    end
end
