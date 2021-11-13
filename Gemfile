source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
# Use postgresql as the database for Active Record
# gem 'pg', '~> 1.1'
# Use mysql as the database for Active Record
# gem 'rack-timeout'
gem 'mysql2', '~> 0.5.3'

# brew extract --version 1.22.4 yarn homebrew/cask
# brew install yarn@1.22.4
# yarn add bootstrap@5.0.0-beta2
# sudo yarn add @popperjs/core@2.0.0-alpha.1
# sudo npm install
#
# brew install node@14
# brew services restart mysql
# brew install mysql2
# brew services start mysql2
# npm install
# bundle config --local build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib --with-cppflags=-I/usr/local/opt/openssl/include"


gem 'aws-sdk-s3', '~> 1.104'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem 'will_paginate', '~> 3.3.1'
gem 'will_paginate-bootstrap', '~> 1.0', '>= 1.0.2'

gem 'redis', '~> 4.5', '>= 4.5.1'
gem 'sidekiq', '~> 6.2', '>= 6.2.2'

gem 'devise', '~> 4.8'
# Para tratamento de arquivo csv
gem 'rubyzip', '>= 2.3.2'
gem 'roo', '>= 2.8.3'
gem 'axlsx'
gem 'axlsx_rails', '~> 0.6.1'
gem 'axlsx_styler', '~> 1.1'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '~> 4.0', '>= 4.0.3'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers', '~> 5.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
