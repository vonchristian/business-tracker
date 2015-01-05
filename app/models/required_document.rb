class RequiredDocument < ActiveRecord::Base
  belongs_to :business
  has_many :documents
end
