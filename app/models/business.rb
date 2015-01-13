class Business < ActiveRecord::Base
  enum asset_size: [:micro_industry, :cottage_industry, :small_scale_industry, :medium, :large]
  belongs_to  :owner, class_name: 'Taxpayer'
  belongs_to :type_of_organization
  has_many :line_of_businesses
  has_many :taxes, through: :line_of_businesses
  has_many :payments
  has_many :required_documents
  has_many :documents, through: :required_documents

  validates :business_name,  presence: true
  accepts_nested_attributes_for :owner


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
