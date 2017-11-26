source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'pg'
gem 'awesome_print'

# Respond with JSON on API by default
gem 'responders', '~> 2.4'

gem 'sshkit', '~> 1.13.1', '>= 1.7.1'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'better_errors', '~> 2.1', '>= 2.1.1'
gem 'rails_12factor', group: :production
gem 'rest-client'

gem 'simple_command', '~> 0.0.9'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # Use Puma as the app server
  gem 'puma', '~> 3.0'
  gem 'rubocop', require: false
  gem 'byebug', platform: [:mri, :mingw, :x64_mingw]
  gem 'annotate'
  gem 'rspec-rails', '~> 3.6'
  gem 'capistrano', '~> 3.4'
  gem 'ffaker'
  gem 'guard-rspec', require: false
  gem 'json_builder'
  gem 'simplecov', :require => false

  gem 'database_cleaner', '~> 1.3'
  gem "factory_bot_rails"
  gem 'launchy'
  gem 'rspec-activemodel-mocks', '~> 1.0'
  gem 'rspec-collection_matchers'
  gem 'rspec-its'
  gem 'rspec_junit_formatter'
  gem 'webmock', '~> 3.0.1'
  gem 'timecop'
  gem 'with_model'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  gem 'shoulda-callback-matchers', '~> 1.1'
  gem 'rails-controller-testing'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
