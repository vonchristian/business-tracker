class Business < ActiveRecord::Base
  delegate :mayors_permit_fee, to: :fees
  scope :expired,            -> { where(workflow_state: :expired)            }
  scope :new_business,  -> { where(workflow_state: :new_business) }
  scope :delinquent,       -> { where(workflow_state: :delinquent)       }
  scope :retired,              -> { where(workflow_state: :retired)             }
  scope :registered,        -> { where(workflow_state: :registered)        }
  delegate :set_mayors_fee, to: :fees

  before_save :set_enterprise_scale

  enum enterprise_scale: [:micro,:cottage, :small_scale, :medium, :large]
  enum industry_type: [:manufacturers_importers_producers,
                                      :banks,
                                      :other_financial_institutions,
                                      :contractors_service_establishments,
                                      :wholesalers_retailers_dealers_distributors,
                                      :transloading_operations,
                                      :other_businesses]

  belongs_to  :owner, class_name: 'Taxpayer'
  has_one :address, as: :addressable
  belongs_to :type_of_organization
  has_many :line_of_businesses

  has_many :taxes
  has_many :business_fees
  has_many :fees, through: :business_fees
  has_many :payments
  has_many :required_documents
  has_many :documents, through: :required_documents

  validates :business_name,  presence: true
  validates :asset_size, numericality: { message: 'Invalid Asset Size' }

  accepts_nested_attributes_for :owner
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :line_of_businesses, allow_destroy: true
  validates :oath_of_undertaking, acceptance: { message: 'You must accept the terms.' }



  include Workflow
      workflow do
        state :new_business do
          event :payment_of_taxes, :transitions_to => :registered
        end
        state :registered do
          event :end_of_year, :transitions_to => :expired
        end
        state :expired do
          event :end_of_registration, :transitions_to => :delinquent
          event :payment_of_taxes, :transitions_to => :renewed
        end
        state :delinquent
        state :renewed
      end

  def owner_name
    self.owner.try(:first_and_last_name)
  end

    def cedula_number
    self.owner.try(:cedula_number)
  end
  def date_issued
    self.owner.try(:cedula_date_issued).strftime('%B %d, %Y')
  end
  def place_issued
    self.owner.try(:place_issued_cedula)
  end
  def official_receipt_number
    self.payments.last.official_receipt_number
  end
  def amount_paid
    self.payments.last.amount
  end
  def full_address
    "#{address.street}, #{address.barangay}, #{address.municipality_or_city}, #{address.province}"
  end

    def build_fees
       Fee.create(self)
      self.fees.save
    end
    def set_taxes
      if self.expired?
       self.taxes.create
      self.save
    end
  end

    def renew
      self.set_fees
      self.set_taxes
      self.update_attributes(workflow_state: :renewed)
      self.save
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
  def set_fees
  self.fees.create!
   end

  private

  def end_of_year
    Time.now.end_of_year?
  end

  def set_enterprise_scale
    return self.enterprise_scale=:micro if self.micro_industry?
    return self.enterprise_scale=:cottage if self.cottage_industry?
    return self.enterprise_scale=:small_scale if self.small_scale_industry?
    return self.enterprise_scale=:medium if self.medium_industry?
    return self.enterprise_scale=:large if self.large_industry?
  end




end
