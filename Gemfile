source 'https://rubygems.org'
ruby '2.1.1'

gem 'bcrypt-ruby', '~> 3.0.0'
gem 'bootstrap-will_paginate'
gem 'decent_exposure', git: "git://github.com/voxdolo/decent_exposure.git", branch: "master"
gem 'haml-rails'
gem 'jbuilder', '~> 1.0.1'
gem 'jquery-rails'
gem 'rails', '4.0.0.rc1'
gem 'redcarpet', '~> 3.1.1'
gem 'pg'
gem 'thin'
gem 'turbolinks'
gem 'will_paginate', '~> 3.0.0'

group :assets do
  gem 'sass-rails',   '~> 4.0.0.rc1'
  gem 'coffee-rails', '~> 4.0.0.rc1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'unicorn'
end

group :test do
  gem 'cucumber-rails'
  gem 'launchy'
  gem 'rspec-rails'
end

group :development, :test do
  gem 'pry-rails'
  gem 'fabrication'
  gem 'database_cleaner'
end
