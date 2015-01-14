class Business < ActiveRecord::Base
  scope :expired,            -> { where(workflow_state: :expired)            }
  scope :new_business,  -> { where(workflow_state: :new_business) }
  scope :delinquent,       -> { where(workflow_state: :delinquent)       }
  scope :retired,              -> { where(workflow_state: :retired)             }
  scope :registered,        -> { where(workflow_state: :registered)        }

  enum industry: [:micro,:cottage, :small_scale, :medium, :large]
  belongs_to  :owner, class_name: 'Taxpayer'
  belongs_to :type_of_organization
  has_many :line_of_businesses
  has_many :taxes, through: :line_of_businesses
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

  private

  def end_of_year
    Time.now.end_of_year?
  end

  def payment_of_taxes


  end

end
