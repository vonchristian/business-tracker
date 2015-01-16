class Taxpayer < ActiveRecord::Base

  validates :first_name, :middle_name, :last_name, :email, :mobile_number, presence: true

  has_many :businesses, foreign_key: :owner_id
  has_many :payments, :through => :businesses
  has_one :address, as: :addressable

  after_validation :titleize_full_name
 include Workflow
      workflow do
        state :new do
          event :end_of_year, :transitions_to => :old
        end
        state :old
      end


  def full_name
    "#{try(:last_name)}, #{try(:first_name)} #{try(:middle_name).first}."
  end

  def first_and_last_name
    "#{try(:first_name).titleize} #{try(:middle_name).first.upcase}. #{try(:last_name).titleize}"
  end

  private
      def titleize_full_name
        self.first_name=first_name.try(:titleize)
      end

end
