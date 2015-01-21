class Taxpayer < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_last_name, :against => [:last_name]
  validates :first_name, :middle_name, :last_name, :email, :mobile_number,
                  :cedula_number, :cedula_date_issued, :cedula_place_issued, presence: true

  has_many :businesses
  has_many :payments, :through => :businesses
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

  def address
     "#{try(:address_street)}, #{try(:address_barangay)}, #{try(:address_municipality)}"
  end

  private
      def titleize_full_name
        self.first_name=first_name.try(:titleize)
      end

end
