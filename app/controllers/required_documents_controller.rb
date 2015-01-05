class RequiredDocumentsController < ApplicationController

  def new
    @required_document = RequiredDocument.new
  end
end
