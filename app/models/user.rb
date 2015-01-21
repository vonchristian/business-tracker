class User < ActiveRecord::Base

   enum role: [:system_administrator, :application_officer, :payment_officer, :approval_officer]

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :system_administrator
  end


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

def full_name
  "#{first_name} #{last_name}"
end

end
