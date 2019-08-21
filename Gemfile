source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'sprockets-rails'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Easily position tooltips. Read more: https://popper.js.org/?ref=heydesigner
gem 'popper_js'
# Add bootstrap functionality
gem 'bootstrap'
# Add pageination functionality. Read more: https://github.com/mislav/will_paginate
gem 'will_paginate', '>= 3.1'
# Simplify Rails form. Read more: https://github.com/plataformatec/simple_form
gem 'simple_form'
# Provides rails access to font-awesome web fonts. Read more: https://github.com/bokmann/font-awesome-rails
gem 'font-awesome-rails'
# Devise is a flexible authentication solution for Rails based on Warde
gem 'devise'
# Forward and reverse geocoding, and IP address geocoding
gem 'geocoder'
# Configuration values often include sensitive information.
gem 'figaro'
# Simple and extremely flexible way to upload files from Ruby applications
gem 'carrierwave', '~> 1.0'
# Configure fog upload for AWS
gem 'fog-aws'
# Neatly displays objects in console
gem 'awesome_print', '~> 1.8'
# Installs lightbox
gem 'lightbox2-rails'
gem 'rails-controller-testing'
gem 'rb-readline'
gem 'owlcarousel-rails'
gem 'websocket-rails'
gem 'redis','3.3.1'
gem 'nokogiri', '1.10.4'
gem 'omniauth-facebook'
# Checks for vulnerable versions of gems in Gemfile.lock
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  # console
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
  # Testing
  gem 'factory_bot_rails'
end

group :development do
  # Brakeman is a static analysis tool which checks Ruby on Rails applications
  # for security vulnerabilities
  gem 'brakeman'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an IRB console on exception pages or by using <%= console %> anywhere
  # in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
