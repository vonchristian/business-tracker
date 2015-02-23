class TaxpayersController < ApplicationController

  def index
    load_taxpayers
  end


  def show
    load_taxpayer
    new_business
  end

  def new
    build_taxpayer
  end

  def create
    build_taxpayer
    save_taxpayer or render 'new'
  end

  def edit
    load_taxpayer
    build_taxpayer
  end

  def update
   load_taxpayer
   build_taxpayer
   save_taxpayer or render 'edit'
end


  def destroy
    load_taxpayer
    @taxpayer.destroy
    redirect_to taxpayers_path
    end
private
    def load_taxpayers
      @taxpayers ||= taxpayer_scope.to_a
    end

    def load_taxpayer
      @taxpayer ||= taxpayer_scope.find(params[:id])
      rescue ActiveRecord::RecordNotFound
  flash[:alert] = "The taxpayer you were looking for could not be found."
  redirect_to taxpayers_path
    end

    def build_taxpayer
      @taxpayer ||=taxpayer_scope.build
      @taxpayer.attributes = taxpayer_params
    end

    def save_taxpayer
      if @taxpayer.save
        redirect_to @taxpayer
      end
    end
    def new_business
      @business=Business.new
    end

    def taxpayer_scope
      Taxpayer.all
    end

def taxpayer_params
  taxpayer_params = params[:taxpayer]
  taxpayer_params ? taxpayer_params.permit( :profile_image, :first_name, :middle_name, :last_name, :email,
                          :mobile_number, :cedula_number, :cedula_date_issued, :cedula_place_issued,
                          :address_street, :address_barangay, :address_municipality, :address_province) : {}
end
end
