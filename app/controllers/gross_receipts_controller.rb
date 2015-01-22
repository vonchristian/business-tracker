class GrossSalesTaxesController < ApplicationController
  def index
    @gross_sales_taxes  = GrossSalesTax.all
  end
  def new
    @gross_sales_tax=current_business.gross_sales_taxes.build
  end

  def create
    @gross_receipt = GrossReceipt.create(gross_receipt_params)
    if @gross_receipt.save
      redirect_to @business
    else
      render :new
    end
  end

  private
      def gross_receipt_params
        params.require(:gross_receipt).permit(:gross_sales_minimum, :gross_sales_maximum, :amount_of_tax_per_anum)
      end
end
