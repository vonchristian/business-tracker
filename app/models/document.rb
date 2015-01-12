class Document < ActiveRecord::Base
  validates :description, :office, presence: true
  has_many :required_documents
  has_many :businesses, through: :required_documents
end

