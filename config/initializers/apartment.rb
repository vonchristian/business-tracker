
require 'apartment/elevators/subdomain'

Apartment.configure do |config|
  config.excluded_models = %w{Account}
  config.use_schemas = true
  config.tenant_names = lambda{ Account.pluck :subdomain }
end

Rails.application.config.middleware.use 'Apartment::Elevators::Subdomain'
