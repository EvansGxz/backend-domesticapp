# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.2", ">= 7.0.2.3"
gem "rake", "~> 13.0", ">= 13.0.6"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Reduces boot times through caching; required in config/boot.rb
gem "authy"
gem "aws-sdk-s3", require: false
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "faker", "~> 1.6", ">= 1.6.6"
gem "net-http"
gem "omniauth"
gem "omniauth-facebook"
gem "omniauth-google-oauth2"
gem "omniauth-rails_csrf_protection"
gem "pry-rails"
gem "rack-cors"

gem "phonelib"
gem "twilio-ruby"
# Use Serializer
gem "active_model_serializers", "~> 0.10.13"

gem "image_processing", ">= 1.2"
gem "jsonapi-serializer"
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", "~> 3"

  # Test runner
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails", "~> 5.0"
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "selenium-webdriver"
end

group :development do
  gem "listen", "~> 3.6.0"
  gem "dotenv-rails"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.1"
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console", ">= 4"
end
