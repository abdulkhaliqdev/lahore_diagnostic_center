source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

gem 'turbolinks', '~> 5'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

gem "sass-rails", "~> 6.0"
gem 'webpacker', '~> 5.0'
gem "devise", "~> 4.9"
gem 'cocoon', '~> 1.2', '>= 1.2.15'
gem "momentjs-rails", "~> 2.29"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem 'pry'
  gem "capistrano", "~> 3.17",                   require: false
  gem "capistrano-rails", "~> 1.6",              require: false
  gem 'capistrano-bundler', '~> 2.0',            require: false
  gem 'capistrano-rvm',                          require: false
  gem 'capistrano3-puma',                        require: false

  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'

  #Dependencies For cap deploy
  gem 'net-ssh', '>= 6.0.2'
  gem 'ed25519', '>= 1.2', '< 2.0'
  gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'
end



gem "jquery-rails", "~> 4.5"
gem "rqrcode", "~> 2.1"
gem "shrine", "~> 3.4"
gem "will_paginate", "~> 3.3"
gem 'wicked_pdf'
gem "wkhtmltopdf-binary", group: :development
gem "wkhtmltopdf-heroku", group: :production
gem "prawn-html", "~> 0.7.1"
gem "matrix", "~> 0.4.2"
gem "prawn", "~> 2.4"


gem "actiontext", "~> 7.0"

gem "trix", "~> 0.10.1"

gem "figaro", "~> 1.2"

gem "activestorage", "~> 7.0"

gem "bootstrap-sass", "~> 3.4"

gem "stackprof", "~> 0.2.25"
