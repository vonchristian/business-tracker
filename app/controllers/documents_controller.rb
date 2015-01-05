class DocumentsController < ApplicationController

  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to documents_path, notice: 'created successfully'
    else
      render :new
    end
  end

  def edit
    @document = Document.find(params[:id])
  end

  def update
    @document = Document.find(params[:id])
    if @document.update_attributs(document_params)
      redirect_to documents_path, notice: 'updated successfully'
    else
      render :edit
    end
  end
  private
      def document_params
        params.require(:document).permit(:description, :office)
      end
end
