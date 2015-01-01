class Tax < ActiveRecord::Base
validates :description, :amount, presence: true
validates :amount, numericality: true

  has_many :payments
  has_many :tax_exemptions
  has_many :ownership_types, through: :tax_exemptions
  belongs_to :business
  has_many :tax_categorizations
  has_many :business_natures, through: :tax_categorizations
end
