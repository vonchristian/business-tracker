class BusinessesController < ApplicationController
  def index
    @businesses = Business.includes(:owner).all
  end
  def new
    @business = Business.new
    @business.build_owner
    @business.line_of_businesses.build
    authorize @business
  end

  def show
    @business = Business.find(params[:id])
    authorize @business

    respond_to do |format|
      format.html
      format.pdf do
        pdf = BusinessPermit.new(@business)
        send_data pdf.render, filename: "#{@business.business_name}-permit.pdf", type: 'application/pdf'
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

  private
  def business_params
    params.require(:business).permit(:industry, :asset_size, :workforce_size, :business_name, :type_of_organization_id, :line_of_business_ids =>[], owner_attributes: [:first_name, :middle_name, :last_name, :email, :mobile_number])
  end
end
