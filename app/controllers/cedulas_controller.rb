class CedulasController < ApplicationController
 def new
    @taxpayer =  Taxpayer.find(params[:taxpayer_id])
    @cedula = Cedula.new

  end
end
