class Business < ActiveRecord::Base

  include PgSearch
  pg_search_scope :text_search, against: [:business_name],
    using: {tsearch: {dictionary: "english", prefix: true}},
    associated_against: {taxpayer: [:last_name, :first_name]}
    # ignoring: :accents

  include PublicActivity::Common
  enum type_of_organization: [:sole_proprietorship, :corporation, :partnership, :association, :cooperative]
  enum status: [:payment_pending, :registered, :expired, :renewed, :delinquent, :revoked]
  enum type_of_business: [:new_business, :old]
  enum enterprise_scale: [:micro,:cottage, :small_scale, :medium, :large]
  enum business_type: [:manufacturers_electric_power_producers_assemblers_repackers_processors,
                                       :wholesalers_dealers_distributors,
                                       :exporters_producers_millers_manufacturers_of_essential_commodities,
                                       :wholesalers__dealers_distributors_of_essential_commodities,
                                       :retailers_of_essential_commodities,
                                       :retailers,
                                       :contractors,
                                       :banks_and_other_financial_institutions,
                                       :sales_of_services]
  enum industry_type: [:manufacturers_importers_producers,
                                      :banks,
                                      :other_financial_institutions,
                                      :contractors_service_establishments,
                                      :wholesalers_retailers_dealers_distributors,
                                      :transloading_operations,
                                      :other_businesses]


  scope :new_businesses, -> {where("created_at >=?", Time.zone.now.beginning_of_year + 20.days)}

  before_create :set_status_to_payment_pending
  before_save :set_capital_tax
  before_save :set_enterprise_scale
  before_save :set_permit_number, :capitalize_barangay



  belongs_to  :taxpayer
  has_many :police_clearance_fees
  has_many :mayors_permit_fees
  has_many :gross_sales_taxes
  has_many :line_of_businesses
  has_many :taxes
  has_many :payments
  has_many :required_documents
  has_many :documents, through: :required_documents

  #validates :status, inclusion: {in: Business.statuses.keys}
  validates :business_name, :industry_type, :business_type,
                :address_barangay, :address_sitio, :address_municipality, :address_province,
                :asset_size, :no_of_employees, :type_of_organization, presence: true
  validates :asset_size,  numericality:{ message: 'Invalid Amount'}
  validates :capital, numericality: { message: 'Invalid Amount'}, on: :create
  # validates :business_name, uniqueness: {scope: :address_barangay}
 # validates :gross_sales, numericality: { message: 'Invalid Amount or less than the required amount', :greater_than =>30000}, on: :update
 # validates :gross_sales, numericality: { message: 'Invalid Asset Size' }
  #validates :oath_of_undertaking, acceptance: { message: 'You must accept the terms.' }

 def revoke
  if self.payments.empty?
   self.update_attributes(status: :revoked)
 else
  false
 end
end
def address
 "#{try(:address_sitio)}, #{try(:address_barangay)}, #{try(:address_municipality)}, #{try(:address_province)}"
  end
 def update_payment_status
    self.update_attributes(status: :registered)
  end
  def line_of_business
    self.line_of_businesses.pluck(:description).join ' , '
  end

  def police_clearance_fee
    50
  end



  def taxpayer_name
    self.taxpayer.try(:first_and_last_name)
  end

   def taxpayer_mobile_number
    self.taxpayer.try(:mobile_number)
  end

  def cedula_number
    self.taxpayer.try(:cedula_number)
  end

  def date_issued
    self.taxpayer.try(:cedula_date_issued).strftime('%B %d, %Y')
  end

  def place_issued
    self.taxpayer.try(:cedula_place_issued)
  end

  def official_receipt_number
    self.payments.last.official_receipt_number
  end

  def amount_paid
    self.payments.last.amount
  end

  def full_address
    "#{address_sitio}, #{address_barangay}, #{address_municipality}, #{address_province}"
  end

  def set_mayors_permit_fee
    self.mayors_permit_fees.create
  end

  def mayors_permit_fee_amount
      self.mayors_permit_fees.last.amount
  end

  def gross_sales_taxes_amount
      self.gross_sales_taxes.last.amount
  end

  def set_gross_sales_taxes
    self.gross_sales_taxes.create
  end

  def renew
    self.set_mayors_permit_fee
    self.set_gross_sales_taxes if self.gross_sales.present?
    self.update_attributes(status: 'payment_pending')
  end

  def end_of_year
   if  Time.now.end_of_year?
    self.update_attributes(status: :expired)
  end
end
def micro_industry?
  self.asset_size<=150_000
end
def cottage_industry?
  self.asset_size<=1_500_000
end

def small_scale_industry?
  self.asset_size<=15_000_000
end
def medium_industry?
  self.asset_size<=60_000_000
end
def large_industry?
  self.asset_size>60_000_000
end

  def set_capital_tax
     self.capital_tax=capital_tax_rate
  end

  def capital_tax_rate
    self.capital * 0.01 * 0.20
  end

  def set_status_to_payment_pending
    self.status=:payment_pending
  end

private
    def set_enterprise_scale
      return self.enterprise_scale=:micro if self.micro_industry?
      return self.enterprise_scale=:cottage if self.cottage_industry?
      return self.enterprise_scale=:small_scale if self.small_scale_industry?
      return self.enterprise_scale=:medium if self.medium_industry?
      return self.enterprise_scale=:large if self.large_industry?
    end
def set_permit_number
  if permit_number.blank?
   self.permit_number=self.id
 end
end

def capitalize_barangay
  self.address_barangay=self.address_barangay.capitalize
end




end
