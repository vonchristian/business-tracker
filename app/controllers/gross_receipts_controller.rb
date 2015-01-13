class GrossReceiptsController < ApplicationController
  def index
    @gross_receipts  = GrossReceipt.all
  end
  def new
    @gross_receipt = GrossReceipt.new
  end

  def create
    @gross_receipt = GrossReceipt.create(gross_receipt_params)
    if @gross_receipt.save
      redirect_to gross_receipts_path
    else
      render :new
    end
  end

  private
      def gross_receipt_params
        params.require(:gross_receipt).permit(:gross_sales_minimum, :gross_sales_maximum, :amount_of_tax_per_anum)
      end
end
