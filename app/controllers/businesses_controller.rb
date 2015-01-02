class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
  end
  def new
    @business = Business.new
    @business.build_owner
  end

  def show
    @business = Business.find(params[:id])
  end
  def edit
      @business = Business.find(params[:id])
  end
  def create
    @business = Business.new(business_params)
    if @business.save
        redirect_to root_path, notice: 'registered successfully'
    else
      render :new
    end
  end

  def update
    @business = Business.find(params[:id])
    if @business.update_attributes(business_params)
      redirect_to businesses_path, notice: 'updated successfully'
    else
      render :edit
    end
  end

  private
  def business_params
    params.require(:business).permit(:business_name, owner_attributes: [:first_name, :middle_name, :last_name, :email, :mobile_number])
  end
end
