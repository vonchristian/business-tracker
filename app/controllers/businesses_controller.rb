class BusinessesController < ApplicationController
  before_filter :set_current_taxpayer, only: [:new]
  def index
    @businesses = Business.includes(:taxpayer).all
    @taxpayers = Taxpayer.all
  end
  def new
    @business = current_taxpayer.businesses.build
    authorize @business
  end
 def create
 s
    @business = current_taxpayer.businesses.create(business_params)
    if @business.save
      @business.set_fees
      @business.set_taxes
        redirect_to @business, notice: 'registered successfully'
    else
      render :new
    end
  end
  def show
    @business = Business.find(params[:id])
    authorize @business

    respond_to do |format|
      format.html
      format.pdf do
        pdf = BusinessPermitPdf.new(@business)
        send_data pdf.render, filename: "#{@business.business_name}-permit.pdf", type: 'application/pdf', disposition: "inline"
      end
    end
  end
  def edit
      @business = Business.find(params[:id])
      authorize @business
  end


  def update
    @business = Business.find(params[:id])
    authorize @business
    if @business.update_attributes(business_params)
      redirect_to businesses_path, notice: 'updated successfully'
    else
      render :edit
    end
  end

  def renew
    @business = Business.find(params[:id])
    @business.renew
  end

  private
  def business_params
    params.require(:business).permit(:permit_number, :industry_type, :asset_size, :workforce_size, :business_name, :type_of_organization_id,  :taxpayer_id)
  end

  def set_current_taxpayer
    @taxpayer = Taxpayer.find(params[:taxpayer_id])
  end
  def current_taxpayer
    @taxpayer = Taxpayer.find(params[:taxpayer_id])
  end
end
