class BusinessRegistrationsController < ApplicationController

  def new
    @business_registration = BusinessRegistration.new
    @business_registration.build_taxpayer
  end

  def create
    @business_registration = BusinessRegistration.new(business_registration_params)
    if @business_registration.save
        redirect_to root_path, notice: 'registered successfully'
    else
      render :new
    end
  end

  private
  def business_registration_params
    params.require(:business_registration).permit(business_attributes: [:business_name], taxpayer_attributes: [:first_name, :middle_name, :last_name, :email, :mobile_number])
  end
end
