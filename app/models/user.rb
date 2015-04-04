class User < ActiveRecord::Base

   enum role: [:system_administrator, :application_officer, :payment_officer, :bir_officer]

  after_initialize :set_default_role, :if => :new_record?
  before_validation :remove_non_digits_from_phone_numbers

  def set_default_role
    self.role ||= :system_administrator
  end


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

def full_name
  "#{first_name} #{last_name}"
end

private
    def remove_non_digits_from_phone_numbers
    self.sms_number = sms_number.to_s.gsub(/\D/, '').to_i if mobile_number.present?
  end

end
