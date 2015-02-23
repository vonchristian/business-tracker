class PoliceClearancesController < ApplicationController
  before_filter :set_police_clearance, only: [:edit, :show, :update, :destroy]

  def index
    @police_clearances = PoliceClearance.all
  end

  def new
    @taxpayer =  Taxpayer.find(params[:taxpayer_id])
    @police_clearance = PoliceClearance.new
  end

  def edit
    @police_clearance = police_clearance.find(params[:id])
    authorize @police_clearance
  end

  def create
    @police_clearance = police_clearance.new(police_clearance_params)
    if @police_clearance.save
      redirect_to @police_clearance, notice: 'police_clearance registered successfully.'
    else
      render :new
    end
  end

  def update
    if @police_clearance.update(police_clearance_params)
    redirect_to @police_clearance,   notice: 'police_clearance updated successfully.'
  else
    render :edit
  end
end

  def show
    @business = Business.new
  end

  def destroy
    @police_clearance.destroy
    redirect_to police_clearances_path
    end
private

def set_police_clearance
  @police_clearance = PoliceClearance.find(params[:id])
  rescue ActiveRecord::RecordNotFound
  flash[:alert] = "The police_clearance you were looking for could not be found."
  redirect_to police_clearances_path
end
def police_clearance_params
  params.require(:police_clearance).permit(:image, :first_name, :middle_name, :last_name, :email,
                          :mobile_number, :cedula_number, :cedula_date_issued, :cedula_place_issued,
                          :address_street, :address_barangay, :address_municipality, :address_province)
end
end
