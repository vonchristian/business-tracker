class Business < ActiveRecord::Base
  belongs_to  :owner, class_name: 'Taxpayer'
  belongs_to :type_of_organization
  has_many :business_natures
  has_many :payments
  has_many :required_documents

  validates :business_name,  presence: true
  accepts_nested_attributes_for :owner


  include Workflow
      workflow do

        state :new do
          event :submit_documents, :transitions_to => :awaiting_payment
        end

        state :awaiting_payment do
          event :payment_of_taxes, :transitions_to => :awaiting_approval
        end

        state :awaiting_approval do
          event :approve, :transitions_to => :registered
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
end
