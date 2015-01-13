class LineOfBusinessesController < ApplicationController
  def index
   @line_of_businesses = LineOfBusiness.all
  end

  def new
    @line_of_business = LineOfBusiness.new
  end

  def create
    @line_of_business = LineOfBusiness.create(line_of_business_params)
    if @line_of_business.save
      redirect_to line_of_businesses_path, notice: 'created successfully'
    else
      render :new
    end
  end

  def edit
    @line_of_business = LineOfBusiness.find(params[:id])
  end

  def update
    @line_of_business = LineOfBusiness.find(params[:id])
    if @line_of_business.update(line_of_business_params)
      redirect_to line_of_businesses_path
    else
      render :edit
    end
  end

  private
      def line_of_business_params
        params.require(:line_of_business).permit(:type_of_business, :description, :psic_code, :tax_ids =>[] )
      end
end
