class TaxesController < ApplicationController

def index
  @taxes = Tax.all
end

def new
  @tax = Tax.new
end

def create
  @tax = Tax.new(tax_params)
  if @tax.save
    redirect_to taxes_path, notice: 'created successfully'
  else
    render :new
  end
end

def edit
  @tax = Tax.find(params[:id])
end
def update
  @tax = Tax.find(params[:id])
    if @tax.update(tax_params)
    redirect_to taxes_path,   notice: 'updated successfully.'
  else
    render :edit
  end
end

private
    def tax_params
      params.require(:tax).permit(:description, :amount, :default)
    end
end
