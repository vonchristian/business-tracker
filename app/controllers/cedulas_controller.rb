class CedulasController < ApplicationController
  def new
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @cedula = @taxpayer.cedulas.build
  end

  def create
    @taxpayer = Taxpayer.find(params[:taxpayer_id])
    @cedula = @taxpayer.cedulas.create(cedula_params)
    if @cedula.save
      redirect_to @taxpayer, notice: "Cedula saved successfully. "
    else
      render :new
    end

  end

  def load_taxpayer
    @taxpayer = Taxpayer.find(params[:taxpayer_id])
  end

  def build_cedula
    @cedula = @taxpayer.cedulas.build
  end

  def save_cedula
    if @cedula.save
      redirect_to @taxpayer, notice: "Cedula saved successfully. "
    else
      render :new
    end
  end

  private
  def cedula_params
    params.require(:cedula).permit(:place_of_issue, :date_of_issue, :cedula_number)
  end
end
