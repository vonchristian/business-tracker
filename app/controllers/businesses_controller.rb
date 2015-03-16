class BusinessesController < ApplicationController
  before_filter :set_business, only: [:edit, :show, :update]

  def registered
    if params[:query].present?
      @businesses = Business.text_search(params[:query]).page(params[:page]).per_page(50)
    else
      @businesses = Business.page(params[:page]).per_page(50)
    end
  end
  def delinquent
    if params[:query].present?
      @businesses = Business.delinquent.text_search(params[:query]).page(params[:page]).per_page(50)
    else
      @businesses = Business.delinquent.page(params[:page]).per_page(50)
    end
  end


  def delinquents_poblacion
    @businesses = Business.delinquent.where(address_barangay: 'Poblacion')
     respond_to do |format|
     format.html
      format.pdf do
        pdf = DelinquencyReportPdf.new(@businesses)
        send_data pdf.render, filename: "permit.pdf", type: 'application/pdf', disposition: "inline"
      end
    end
  end
  def delinquents_impugong
    @businesses = Business.delinquent.where(address_barangay: 'Impugong')
     respond_to do |format|
     format.html
      format.pdf do
        pdf = DelinquencyReportPdf.new(@businesses)
        send_data pdf.render, filename: "delinquent(Impugong).pdf", type: 'application/pdf', disposition: "inline"
      end
    end
  end
  def delinquents_ahin
    @businesses = Business.delinquent.where(address_barangay: 'Ahin')
     respond_to do |format|
     format.html
      format.pdf do
        pdf = DelinquencyReportPdf.new(@businesses)
        send_data pdf.render, filename: "delinquent(Ahin).pdf", type: 'application/pdf', disposition: "inline"
      end
    end
  end
  def delinquents_apapid
    @businesses = Business.delinquent.where(address_barangay: 'Ap-apid')
     respond_to do |format|
     format.html
      format.pdf do
        pdf = DelinquencyReportPdf.new(@businesses)
        send_data pdf.render, filename: "delinquent(Ap-apid).pdf", type: 'application/pdf', disposition: "inline"
      end
    end
  end
  def delinquents_binablayan
    @businesses = Business.delinquent.where(address_barangay: 'Binablayan')
     respond_to do |format|
     format.html
      format.pdf do
        pdf = DelinquencyReportPdf.new(@businesses)
        send_data pdf.render, filename: "delinquent(Binablayan).pdf", type: 'application/pdf', disposition: "inline"
      end
    end
  end
  def delinquents_wangwang
    @businesses = Business.delinquent.where(address_barangay: 'Wangwang')
     respond_to do |format|
     format.html
      format.pdf do
        pdf = DelinquencyReportPdf.new(@businesses)
        send_data pdf.render, filename: "delinquent(Wangwang).pdf", type: 'application/pdf', disposition: "inline"
      end
    end
  end
  def delinquents_eheb
    @businesses = Business.delinquent.where(address_barangay: 'Eheb')
     respond_to do |format|
     format.html
      format.pdf do
        pdf = DelinquencyReportPdf.new(@businesses)
        send_data pdf.render, filename: "delinquent(Eheb).pdf", type: 'application/pdf', disposition: "inline"
      end
    end
  end
  def delinquents_danggo
    @businesses = Business.delinquent.where(address_barangay: 'Danggo')
     respond_to do |format|
     format.html
      format.pdf do
        pdf = DelinquencyReportPdf.new(@businesses)
        send_data pdf.render, filename: "delinquent(Danggo).pdf", type: 'application/pdf', disposition: "inline"
      end
    end
  end
  def delinquents_luhong
    @businesses = Business.delinquent.where(address_barangay: 'Luhong')
     respond_to do |format|
     format.html
      format.pdf do
        pdf = DelinquencyReportPdf.new(@businesses)
        send_data pdf.render, filename: "delinquent(Luhong).pdf", type: 'application/pdf', disposition: "inline"
      end
    end
  end
  def delinquents_gumhang
    @businesses = Business.delinquent.where(address_barangay: 'Gumhang')
     respond_to do |format|
     format.html
      format.pdf do
        pdf = DelinquencyReportPdf.new(@businesses)
        send_data pdf.render, filename: "delinquent(Gumhang).pdf", type: 'application/pdf', disposition: "inline"
      end
    end
  end
  def delinquents_tulludan
    @businesses = Business.delinquent.where(address_barangay: 'Tulludan')
     respond_to do |format|
     format.html
      format.pdf do
        pdf = DelinquencyReportPdf.new(@businesses)
        send_data pdf.render, filename: "delinquent(Tulludan).pdf", type: 'application/pdf', disposition: "inline"
      end
    end
  end
  def delinquents_tukucan
    @businesses = Business.delinquent.where(address_barangay: 'Tukucan')
     respond_to do |format|
     format.html
      format.pdf do
        pdf = DelinquencyReportPdf.new(@businesses)
        send_data pdf.render, filename: "delinquent(Tukucan).pdf", type: 'application/pdf', disposition: "inline"
      end
    end
  end

  def index
    if params[:query].present?
    @businesses = Business.text_search(params[:query]).page(params[:page]).per_page(30)
  else
    @businesses = Business.page(params[:page]).per_page(30)
    @taxpayers = Taxpayer.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PermitReportPdf.new(@businesses)
        send_data pdf.render, filename: "permit.pdf", type: 'application/pdf', disposition: "inline"
      end
    end
    end
  end
  def dole_report
    @businesses = Business.registered
    @taxpayers = Taxpayer.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = DoleReportPdf.new(@businesses)
        send_data pdf.render, filename: "dole_report.pdf", type: 'application/pdf', disposition: "inline"
      end
    end
  end
   def registered_businesses_report
    @businesses = Business.registered
    @taxpayers = Taxpayer.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = RegisteredBusinessesReportPdf.new(@businesses)
        send_data pdf.render, filename: "registered_businesses_report.pdf", type: 'application/pdf', disposition: "inline"
      end
    end
  end
  def unrenewed_businesses_report
    @businesses = Business.delinquent
    @taxpayers = Taxpayer.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = UnrenewedBusinessesReportPdf.new(@businesses)
        send_data pdf.render, filename: "unrenewed_businesses_report.pdf", type: 'application/pdf', disposition: "inline"
      end
    end
  end
   def bir_report
    @businesses = Business.registered.where(bir_registered: nil)
    @taxpayers = Taxpayer.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = BirReportPdf.new(@businesses)
        send_data pdf.render, filename: "bir_report.pdf", type: 'application/pdf', disposition: "inline"
      end
    end
  end
  def new
    @taxpayer =  Taxpayer.find(params[:taxpayer_id])
    @business = @taxpayer.businesses.build
    authorize @business
  end
 def create
    @business = current_taxpayer.businesses.create(business_params)
    authorize @business
    if @business.save
      @business.set_mayors_permit_fee
      @business.set_capital_tax
      @business.set_status_to_payment_pending
      @business.create_activity :create, owner: current_user
        redirect_to @business, notice: 'registered successfully'
    else
      render :new
    end
  end
  def show
    authorize @business
   @taxpayer=@business.taxpayer
    respond_to do |format|
      format.html
      format.pdf do
        pdf = BusinessPermitPdf.new(@business)
        send_data pdf.render, filename: "#{@business.business_name}-permit.pdf", type: 'application/pdf', disposition: "inline"
      end
    end
  end
  def edit
      authorize @business
  end


  def update
    authorize @business
    if @business.update_attributes(business_params)
      @business.set_gross_sales_taxes if !@business.revoked?
      @business.set_mayors_permit_fee
      @business.renew if @business.expired?
      redirect_to @business, notice: 'updated successfully'
    else
      render :edit
    end
  end

  def renew
    @business = Business.find(params[:id])
  end

   def revoke
    @business = Business.find(params[:id])
    @business.revoke
  end

 def revoked
    if params[:query].present?
      @businesses = Business.revoked.text_search(params[:query]).page(params[:page]).per_page(50)
    else
      @businesses = Business.revoked.page(params[:page]).per_page(50)
    end
  end

  private
  def business_params
    params.require(:business).permit(:barangay_clearance, :reason_of_revocation, :type_of_business, :sanitary_inspection_cleared, :police_clearance_cleared, :health_certificate_cleared, :bir_registered, :application_date, :status, :no_of_employees, :gross_sales, :capital, :business_type, :type_of_organization, :permit_number, :industry_type, :asset_size, :business_name,   :address_sitio, :address_barangay, :address_municipality, :address_province)
  end



  def set_current_taxpayer
    @taxpayer = Taxpayer.find_by_id(params[:taxpayer_id])
  end

  def current_taxpayer
    @taxpayer = Taxpayer.find_by_id(params[:taxpayer_id])
  end

  def set_business
    @business = Business.find(params[:id])
    rescue ActiveRecord::RecordNotFound
  flash[:alert] = "The business you were looking for could not be found."
  redirect_to businesses_path
end
end
