class Business < ActiveRecord::Base
  include Forwardable
  delegate :mayors_permit_fee, :sanitary_inspection_fee, :police_clearance_fee, to: :business_fees
  scope :expired,            -> { where(workflow_state: :expired)            }
  scope :new_business,  -> { where(workflow_state: :new_business) }
  scope :delinquent,       -> { where(workflow_state: :delinquent)       }
  scope :retired,              -> { where(workflow_state: :retired)             }
  scope :registered,        -> { where(workflow_state: :registered)        }

  before_save :set_enterprise_scale

  enum enterprise_scale: [:micro,:cottage, :small_scale, :medium, :large]
  belongs_to  :owner, class_name: 'Taxpayer'
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
