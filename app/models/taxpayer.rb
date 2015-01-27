class Taxpayer < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "200x200>", :thumb => "120x120>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  enum status:[:new_taxpayer, :old, :deliquent]
  include PgSearch
  pg_search_scope :search_last_name, :against => [:last_name]
  validates :first_name, :middle_name, :last_name, :mobile_number,
                  :cedula_number, :cedula_date_issued, :cedula_place_issued, presence: true

  has_many :businesses
  has_many :payments, :through => :businesses
  after_validation :titleize_full_name

  def full_name
    "#{try(:last_name)}, #{try(:first_name)} #{try(:middle_name).first}."
  end

  def first_and_last_name
    "#{try(:first_name).titleize} #{try(:middle_name).first.upcase}. #{try(:last_name).titleize}"
  end

  def address
     "#{try(:address_street)}, #{try(:address_barangay)}, #{try(:address_municipality)}, #{try(:address_province)}"
  end

  private
      def titleize_full_name
        self.first_name=first_name.try(:titleize)
      end
      def set_status
      end
end
