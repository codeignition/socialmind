ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.include FactoryGirl::Syntax::Methods
  config.include Mongoid::Matchers, type: :model
  config.include Devise::TestHelpers, type: :controller

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do |example|
    DatabaseCleaner.start
    ActionMailer::Base.deliveries.clear
  end

  config.after(:each) do
    DatabaseCleaner.clean
    ActionMailer::Base.deliveries.clear
  end

  config.order = 'random'
end
