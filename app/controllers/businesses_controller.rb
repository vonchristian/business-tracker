class BusinessesController < ApplicationController
before_action :set_business, only: [:show, :edit, :update, :destroy]
before_action :set_taxpayer, only: [:new, :show, :edit, :update, :destroy]
def new
  @business = @taxpayer.businesses.build
end

def create
  @business = @taxpayer.businesses.build(business_params)
    if @business.save
      redirect_to [@taxpayer, @business], notice: 'Business has been registered successfully.'
    else
      render :new, alert: 'Business has not been registered.'
  end
end

private
    def set_business
      @business = @taxpayer.businesses.find(params[:id])
    end
    def set_taxpayer
       @taxpayer = Taxpayer.find(params[:taxpayer_id])
    end
end
