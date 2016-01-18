class CedulasController < ApplicationController
  def new
    @taxpayer = Taxpayer.find(params[:taxpayer_id])
    @cedula = @taxpayer.cedulas.build
  end
end
