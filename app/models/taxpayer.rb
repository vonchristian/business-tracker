class Taxpayer < ActiveRecord::Base
  validates :first_name, :middle_name, :last_name, :email, :mobile_number, presence: true
  validates :mobile_number, uniqueness: true
  has_many :businesses
  has_one :address, as: :addressable



  def full_name
    "#{try(:last_name)}, #{try(:first_name)} #{try(:middle_name).first}."
  end

end
