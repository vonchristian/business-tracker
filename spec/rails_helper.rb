ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'database_cleaner'
require 'capybara/rspec'
require 'shoulda/matchers'
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
Capybara.app_host = 'http://example.com'
ActiveRecord::Migration.maintain_test_schema!
Rails.application.routes.default_url_options[:host] = 'test.host'

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.include Capybara::DSL
  config.include Rails.application.routes.url_helpers
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller
  config.order = "random"

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
   # Apartment::Tenant.reset
    #drop_schemas
    Capybara.app_host = 'http://example.com'

  end
end
