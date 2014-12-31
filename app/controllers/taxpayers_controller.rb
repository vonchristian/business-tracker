class TaxpayersController < ApplicationController
  before_filter :set_taxpayer, only: [:edit, :show, :update, :destroy]

  def index
    @taxpayers = Taxpayer.all
  end

  def new
    @taxpayer = Taxpayer.new
  end

  def edit
  end

  def create
    @taxpayer = Taxpayer.new(taxpayer_params)
    if @taxpayer.save
      redirect_to @taxpayer, notice: 'Taxpayer registered successfully.'
    else
      render :new
    end
  end

  def update
    if @taxpayer.update(taxpayer_params)
    redirect_to @taxpayer,   notice: 'Taxpayer updated successfully.'
  else
    render :edit
  end
end

  def show
  end

  def destroy
    @taxpayer.destroy
    redirect_to taxpayers_path
    end
private

def set_taxpayer
  @taxpayer = Taxpayer.find(params[:id])
  rescue ActiveRecord::RecordNotFound
  flash[:alert] = "The taxpayer you were looking for could not be found."
  redirect_to taxpayers_path
end
def taxpayer_params
  params.require(:taxpayer).permit(:first_name, :middle_name, :last_name, :email, :mobile_number)
end
end
