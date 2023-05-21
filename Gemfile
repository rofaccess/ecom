source 'https://rubygems.org'

gem 'rails', '3.2.22.5'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


gem 'rails-api'

gem 'sqlite3'

group :test do
  # RSpec for Rails. https://github.com/rspec/rspec-rails/tree/v3.9.1
  gem 'rspec-rails', '~> 3.9'

  # Code coverage for Ruby with a powerful configuration library and automatic merging of coverage across test suites.
  # https://github.com/simplecov-ruby/simplecov/tree/v0.17.1
  gem 'simplecov', '~> 0.17', require: false
end

group :development do
  # A Ruby static code analyzer and formatter, based on the community Ruby style guide. https://github.com/rubocop/rubocop/tree/v0.41.2
  # Nota: Se usa rubocop y no rubocop-rails porque a pesar que rubocop-rails tiene el tag 0.41.2, este en realidad era un fork de rubocop 0.41.2 y no se puede
  # instalar desde rubocop-rails. La primer versión de rubocop-rails es la 2.0.0 y no es compatible con ruby 1.9.3
  gem 'rubocop', '~> 0.41', require: false

  # A static analysis security vulnerability scanner for Ruby on Rails applications. https://github.com/presidentbeef/brakeman/tree/v4.4.0
  gem 'brakeman', '~> 4.4', require: false

  # help to kill N+1 queries and unused eager loading. https://github.com/flyerhzm/bullet/tree/5.4.3
  gem 'bullet', '~> 5.4.0'
end

# Simple, efficient background processing for Ruby. https://github.com/sidekiq/sidekiq/tree/v5.0.3
gem 'sidekiq', '~> 5.0.3'

# To use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
