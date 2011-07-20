unless ENV['RAILSONFIRE']
  require 'simplecov'
  SimpleCov.start do
    %w(Models Helpers Services Cells Observers Uploaders).each do |name|
      add_group name, "app/#{name.downcase}"
    end
    add_filter '/test/'
    add_filter '/features/'
    add_filter '/config/'
    add_filter '/db/'
    add_filter '/vendor/'
    add_filter '/lib/'

    # Tested at an integration level
    add_filter '/app\/controllers/'
    add_filter '/app\/mailers/'
  end
end

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/spec'
require 'machinist/active_record'
require 'database_cleaner'
DatabaseCleaner.strategy = :transaction
require 'blueprints'

Dir[Rails.root.join("test/support/**/*.rb")].each {|f| require f}
require 'minitest/autorun'
require 'purdytest' unless ENV["RAILSONFIRE"]
