# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Gems
  config.gem "capistrano-ext", :lib => "capistrano"
  config.gem "configatron"
  config.gem 'rspec', :lib => false
  config.gem 'rspec-rails', :lib => false
  config.gem 'rack', :version => '>= 1.0.0' 
  config.gem 'mislav-will_paginate', :version => '~> 2.3.7', :lib => 'will_paginate',   :source => 'http://gems.github.com'
  config.gem 'meta-tags', :lib => 'meta_tags', :source => 'http://gemcutter.org'
  config.gem 'paperclip', :source => 'http://gemcutter.org'
  config.gem 'josevalim-inherited_resources', :lib => 'inherited_resources'
  
  # Make Time.zone default to the specified zone, and make Active Record store time values
  # in the database in UTC, and return them converted to the specified local zone.
  config.time_zone = 'UTC'
  
  # The internationalization framework can be changed to have another default locale (standard is :en) or more load paths.
  # All files from config/locales/*.rb,yml are added automatically.
  # config.i18n.load_path << Dir[File.join(RAILS_ROOT, 'my', 'locales', '*.{rb,yml}')]
  config.i18n.default_locale = :pt
  config.cache_store = :file_store, %W( #{RAILS_ROOT}/public/frags )
  config.active_record.observers = :user_observer
end

#this is also used on dropdowns
STATES={'Activo' => "active", 'Draft' => "draft"}
LANGUAGES={'en' => 'en', 'pt' => 'pt'}