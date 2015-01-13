class LineOfBusiness < ActiveRecord::Base

  enum type_of_business: [:manufacturer, :wholesaler, :exporter, :retailer, :bank, :sale_of_service, :peddler]
  belongs_to :business_nature
  belongs_to :business
  has_many :documents
  has_many :line_of_business_taxes
  has_many :taxes, through: :line_of_business_taxes

  def to_label
    "#{description}"
  end
end
