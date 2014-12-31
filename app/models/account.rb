class Account < ActiveRecord::Base

  RESTRICTED_SUBDOMAINS = %w(www http https)

  belongs_to :owner, class_name: 'User'

  validates :owner,  presence: true
  validates :subdomain, presence: true,
                                       uniqueness: {case_sensitive: false},
                                       format: {with: /\A[\w\-]+\Z/i, message: 'contains invalid characters'},
                                       exclusion: { in: RESTRICTED_SUBDOMAINS, message: 'restricted'}

  before_validation :downcase_subdomain

  accepts_nested_attributes_for :owner
  def create_subdomain
      Apartment::Tenant.create(@account.subdomain)
      Apartment::Tenant.switch(@account.subdomain)
      @account.save

  end

  private
   def downcase_subdomain
    self.subdomain = subdomain.try(:downcase)
  end
end
