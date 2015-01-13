class Tax < ActiveRecord::Base

  enum type_of_tax: [:mayors_permit_fee, :regulatory_fee, :business_tax]
scope :default_taxes, -> {Tax.where(default: true)}
 scope :not_default_taxes, -> {Tax.where(default: false)}
 validates :description, :amount, presence: true
 validates :amount, numericality: true

  has_many :payments
  has_many :tax_exemptions
  has_many :ownership_types, through: :tax_exemptions
  belongs_to :business
  has_many :line_of_business_taxes
  has_many :line_of_businesses, through: :line_of_business_taxes

  def to_label
    "#{description} - P #{amount}"
  end
end
