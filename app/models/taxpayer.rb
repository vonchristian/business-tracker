class Taxpayer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
# scope :with_delinquent_business, joins(:businesses).merge(Business.delinquent)
  attachment :profile_image
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

 include PgSearch
  pg_search_scope :text_search, against: [:last_name, :first_name],
    using: {tsearch: {dictionary: "english", prefix: true}},
    associated_against: {businesses: :business_name}

  validates  :first_name, :middle_name, :last_name, :mobile_number,
             :cedula_number, :cedula_date_issued, :cedula_place_issued,
             :gender, presence: true

  has_many :businesses
  has_one :police_clearance
  has_many :cedulas
  has_many :payments, :through => :businesses

  scope :female, ->{Taxpayer.where(gender: 'Female')}
  scope :with_delinquent_business, ->{Taxpayer.joins(:businesses).merge(Business.delinquent)}
  scope :with_pending_payments, ->{Taxpayer.joins(:businesses).merge(Business.payment_pending)}

  after_validation :titleize_attributes
  before_save :set_id

  def self.update_cedula_status
    if Time.now.end_of_year
      update_attributes(status: :cedula_expired)
    end
  end
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
      def titleize_attributes
        self.first_name=first_name.try(:titleize)
        self.middle_name = middle_name.try(:titleize)
        self.last_name = last_name.try(:titleize)
        self.gender    = gender.try(:titleize)
      end
      def set_status
      end
      def set_id
        if self.id.blank?
        self.id = Taxpayer.last.id.succ if Taxpayer.any?
      end
      end

      def self.expire_all_cedula
        Taxpayer.update_all(cedula_number: nil, cedula_place_issued: nil, cedula_date_issued: nil)
      end
end
