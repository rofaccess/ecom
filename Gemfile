source 'https://rubygems.org'

# Ruby on Rails. https://github.com/rails/rails/tree/v3.2.22.5
gem 'rails', '3.2.22.5'
# Rails for API only applications. https://github.com/rails-api/rails-api/tree/v0.4.1
# Se usar esta gema porque es una versión light para APIs
gem 'rails-api', '0.4.1'
# A PostgreSQL client library for Ruby. https://github.com/ged/ruby-pg/tree/v0.18.4
gem 'pg', '0.18.4'

group :test do
  # Code coverage for Ruby with a powerful configuration library and automatic merging of coverage across test suites.
  # https://github.com/simplecov-ruby/simplecov/tree/v0.17.1
  gem 'simplecov', '0.17.1', require: false
end

group :development do
  # A Ruby static code analyzer and formatter, based on the community Ruby style guide. https://github.com/rubocop/rubocop/tree/v0.41.2
  # Nota: Se usa rubocop y no rubocop-rails porque a pesar que rubocop-rails tiene el tag 0.41.2, este en realidad era un fork de rubocop 0.41.2 y no se puede
  # instalar desde rubocop-rails. La primer versión de rubocop-rails es la 2.0.0 y no es compatible con ruby 1.9.3
  gem 'rubocop', '0.41.2', require: false

  # A static analysis security vulnerability scanner for Ruby on Rails applications. https://github.com/presidentbeef/brakeman/tree/v4.4.0
  gem 'brakeman', '4.4.0', require: false

  # help to kill N+1 queries and unused eager loading. https://github.com/flyerhzm/bullet/tree/5.4.3
  gem 'bullet', '5.4.3'

  # A library for bulk insertion of data into your database using ActiveRecord. https://github.com/zdennis/activerecord-import/tree/v1.0.4
  gem 'activerecord-import', '1.0.3'
end

group :development, :test do
  # A library for generating fake data such as names, addresses, and phone numbers. https://github.com/faker-ruby/faker/tree/v1.6.3
  gem 'faker', '1.6.3'

  # RSpec for Rails. https://github.com/rspec/rspec-rails/tree/v3.9.1
  # Nota: Si esta gema se agrega solo en el grupo test, al usar 'rails g scaffold product name:string' no se generaran los specs
  # y se seguirá usando unit tests.
  gem 'rspec-rails', '3.9.1'

  # Factory Bot Rails. https://github.com/thoughtbot/factory_bot_rails/tree/v4.11.1
  # Los fixtures son reemplazados por factories al agregar esta gema
  # Nota: No pude hacer que FactoryBot setee el person_id en un cliente, tal vez no es una buena práctica por eso no
  # es tan simple, o no lo hice de la manera adecuada porque no encontré la documentación correcta para esta versión.
  # gem 'factory_bot_rails', '4.11.1'
end

# Easy file attachment management for ActiveRecord. https://github.com/thoughtbot/paperclip/tree/v4.2.4
# gem 'paperclip', '4.2.4'

# Simple, efficient background processing for Ruby. https://github.com/sidekiq/sidekiq/tree/v2.17.8
gem 'sidekiq', '2.17.8'

# Required gems to debug specs in RubyMine using ruby 1.9.x
gem 'ruby-debug-base19x', '0.11.32', require: false
# An interface which glues ruby-debug to IDEs like Eclipse (RDT), NetBeans and RubyMine. https://github.com/ruby-debug/ruby-debug-ide/tree/master
gem 'ruby-debug-ide', '0.7.3', require: false

# Adds foreign key helpers to migrations and correctly dumps foreign keys to schema.rb. https://github.com/matthuhiggins/foreigner
gem 'foreigner', '1.7.4'

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
