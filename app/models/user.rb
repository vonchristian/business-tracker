class User < ActiveRecord::Base
  ROLES=%w(application_officer payment_officer approval_officer system_administrator)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

  #after_validation :set_first_user_as_admin

  private
      def set_first_user_as_admin
        self.role = 'system_administrator' if User.count==1
      end
end
