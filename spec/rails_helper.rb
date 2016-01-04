# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
require 'rspec/rails'
require "paperclip/matchers"
require 'capybara/rspec'
require 'database_cleaner'
require 'capybara/rails'
require 'shoulda/matchers'
require "pundit/rspec"
# ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
   config.include Rails.application.routes.url_helpers
   config.include RSpec::Rails::RequestExampleGroup, type: :feature
   config.include Paperclip::Shoulda::Matchers
   config.include FactoryGirl::Syntax::Methods
   config.before(:suite) do
     DatabaseCleaner[:active_record].strategy = :transaction
     DatabaseCleaner.clean_with(:truncation)
   end
   config.before(:each) do
     DatabaseCleaner.start
   end
   config.after(:each) do
     DatabaseCleaner.clean
   end
end
