class Business < ActiveRecord::Base
  attachment :logo
  include PgSearch
  include EnterpriseScaleSetter
  include Date::QuarterRanges

  pg_search_scope :text_search, against: [:business_name, :permit_number],
    using: {tsearch: {dictionary: "english", prefix: true}},
    associated_against: {taxpayer: [:last_name, :first_name]}

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
  enum industry_type: [ :manufacturers_importers_producers,
                        :banks,
                        :other_financial_institutions,
                        :contractors_service_establishments,
                        :wholesalers_retailers_dealers_distributors,
                        :transloading_operations,
                        :other_businesses]

  scope :owned_by_women, ->{Business.joins(:taxpayer).merge(Taxpayer.female)}

  before_create :set_status_to_payment_pending
  before_save :set_capital_tax
  before_save :set_enterprise_scale
  before_save :set_permit_number, :capitalize_barangay
  after_commit :set_application_date

  belongs_to :taxpayer
  has_many :mayors_permit_fees
  has_many :gross_sales_taxes
  has_many :line_of_businesses
  has_many :payments

  validates :business_name, :industry_type, :business_type,
                :address_barangay, :address_sitio, :address_municipality, :address_province,
                :asset_size, :no_of_employees, :type_of_organization, presence: true
  validates :asset_size,  numericality:{ message: 'Invalid Amount'}
  validates :capital, numericality: { message: 'Invalid Amount'}, on: :create

  delegate :full_name, to: :taxpayer, prefix: true


  def self.first_quarter
    where("created_at >= ? AND created_at < ?", DateTime.current.beginning_of_year, DateTime.current.beginning_of_year.end_of_quarter)
  end

  def self.group_by(date)
  end

  def revoke
    self.update_attributes(status: :revoked, revoked_at: Time.zone.now) if self.registered?
  end

  def address
    "#{try(:address_sitio)}, #{try(:address_barangay)}, #{try(:address_municipality)}, #{try(:address_province)}"
  end

  def update_payment_status
    self.update_attributes(status: :registered)
  end

  def line_of_business
    self.line_of_businesses.last.description
  end

  def payments_total
    self.payments.sum(:amount)
  end

  def taxpayer_contact_details
    self.taxpayer.try(:mobile_number) || self.taxpayer.try(:email)
  end

  def date_of_application
    self.created_at.strftime('%B %d, %Y')
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
    self.gross_sales_taxes.create if self.gross_sales.present?
  end

  def renew
    set_mayors_permit_fee
    set_gross_sales_taxes
    update_attributes(status: :payment_pending, renewed_at: Time.zone.now)
  end

  def calculate_taxes_for_current_year

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

  def self.percentage_of_business_owned_by_women
    ((self.owned_by_women.count.to_f / self.count.to_f) * 100).ceil
  end

  def self.percentage_of_single_proprietorship_new_business_owned_by_women
    ((self.new_business.owned_by_women.count.to_f / self.new_business.count.to_f) * 100).ceil
  end

private

    def set_permit_number
      if permit_number.blank?
       self.permit_number=self.id
     end
    end

    def capitalize_barangay
      self.address_barangay=self.address_barangay.capitalize
    end

    def self.update_status_of_police_clearance
      self.registered.update_all(police_clearance_cleared: false)
    end

    def self.update_status_of_new_businesses
      self.new_business.update_all(type_of_business: :old)
    end

    def set_application_date
      if self.application_date.nil?
        self.application_date=self.created_at
      end
    end

end
