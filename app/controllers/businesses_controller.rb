class BusinessesController < ApplicationController
  def index
    @businesses = Business.includes(:taxpayer).all
    @taxpayers = Taxpayer.all
  end
  def new
    @taxpayer =  Taxpayer.find(params[:taxpayer_id])
    @business = @taxpayer.businesses.build
  end
 def create
    @business = current_taxpayer.businesses.create(business_params)
    if @business.save
      @business.set_mayors_permit_fee
      @business.set_business_fee
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
      @business.set_mayors_permit_fee
      redirect_to @business, notice: 'updated successfully'
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
    params.require(:business).permit(:business_type, :type_of_organization, :permit_number, :industry_type, :asset_size, :workforce_size, :business_name,   :address_street, :address_barangay, :address_municipality, :address_province)
  end

  def set_current_taxpayer
    @taxpayer = Taxpayer.find_by_id(params[:taxpayer_id])
  end

  def current_taxpayer
    @taxpayer = Taxpayer.find_by_id(params[:taxpayer_id])
  end
end
