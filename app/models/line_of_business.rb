class LineOfBusiness < ActiveRecord::Base
 validates :description, presence: true
  enum type_of_business: [:manufacturer, :wholesaler, :exporter, :retailer, :bank, :sale_of_service, :peddler]
  belongs_to :mayors_fee
  belongs_to :business
  has_many :documents
  has_many :line_of_business_taxes
  has_many :taxes, through: :line_of_business_taxes

  def to_label
    "#{description}"
  end
  def business_name
    business.business_name
  end
end
