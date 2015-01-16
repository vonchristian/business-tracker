class BusinessesController < ApplicationController
  def index
    @businesses = Business.includes(:owner).all
  end
  def new
    @business = Business.new
    @business.build_owner
    @business.build_address
    @business.line_of_businesses.build
    authorize @business
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
  def create
    @business = Business.new(business_params)
    authorize @business
    if @business.save
      @business.set_fees
      @business.set_taxes
        redirect_to root_path, notice: 'registered successfully'
    else
      render :new
    end
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
    params.require(:business).permit(:permit_number, :industry_type, :asset_size, :workforce_size, :business_name, :type_of_organization_id,  address_attributes: [:street, :barangay, :municipality_or_city, :province], owner_attributes: [:first_name, :middle_name, :last_name, :email, :mobile_number, :cedula_number, :cedula_date_issued, :place_issued_cedula, :tin_number])
  end
end
