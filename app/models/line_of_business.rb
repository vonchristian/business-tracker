class LineOfBusiness < ActiveRecord::Base
  belongs_to :business_nature
  belongs_to :business
  has_many :documents
end
