source 'https://rubygems.org'
#source 'https://production.cf.rubygems.org'

gem 'rails', '~> 3.2.2'

gem 'pg'
gem 'foreigner'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass',      '0.12.rc.1'
  
  # packaging
  gem 'therubyracer'
  gem 'uglifier', '>= 1.0.3'
end

gem 'haml'
gem 'jquery-rails'

gem 'inherited_resources'
gem 'has_scope'

gem 'formtastic'

# Authentication
gem 'devise'
gem 'devise_openid_authenticatable'

group :test do
  gem 'shoulda'
  gem 'shoulda-matchers'
  gem 'shoulda-context'
  
  gem "factory_girl_rails", "~> 1.7.0"
end

gem "faker", "~> 1.0", :group => [:test, :development]

# unicorn for performance and concurrency in heroku's free plan.
gem 'unicorn'
