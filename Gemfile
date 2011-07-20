source 'http://rubygems.org'

# Base
gem 'rails', '3.1.0.rc4'
gem "devise"
gem "jquery-rails"
gem "oa-oauth", :require => "omniauth/oauth"

# Template
gem "slim"
gem "slim-rails"
gem 'compass', git: 'https://github.com/chriseppstein/compass.git', branch: 'rails31'
gem 'sass-rails'
gem 'uglifier'
# gem 'coffee-script'
# gem 'barista'

# View improvements
gem 'simple_form'
gem "simple-navigation"
gem 'flash_messages_helper'
gem 'button_form'
gem 'client_side_validations'
gem "flash_messages_helper"

# Controllers improvements
gem 'inherited_resources'
gem 'responders'
gem 'high_voltage'

# Uploads
# gem 'carrierwave'

group :production do
  gem 'pg'
end

group :development do
  gem 'foreman'
  gem 'heroku'
end

group :test do
  gem 'rack-test', git: 'git://github.com/oriolgual/rack-test.git'
  gem 'capybara'
  gem 'cucumber-rails'
  gem 'minitest'
  gem 'mocha'
  gem 'simplecov', require: false
  gem 'database_cleaner'
  gem 'purdytest', require: false
  gem 'launchy'
  gem 'growl'
  gem 'rb-fsevent'
  gem 'guard'
  gem 'guard-cucumber'
  gem 'guard-minitest', '>= 0.4.0'
  gem 'guard-annotate'
end

group :development, :test do
  gem 'sqlite3'
  # gem 'forgery'
  gem 'machinist', '>= 2.0.0.beta1'
end
