class LineOfBusinessesController < ApplicationController
before_filter :current_business, only: [:new, :create]
  def index
   @line_of_businesses = LineOfBusiness.all
  end

  def new
    @line_of_business = current_business.line_of_businesses.build
  end

  def create
    @line_of_business = current_business.line_of_businesses.create(line_of_business_params)
    if @line_of_business.save
      redirect_to @business, notice: 'created successfully'
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

      def current_business
        @business = Business.find(params[:business_id])
      end
end
