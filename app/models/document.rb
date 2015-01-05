class Document < ActiveRecord::Base
  belongs_to :required_document
  belongs_to :business
end

