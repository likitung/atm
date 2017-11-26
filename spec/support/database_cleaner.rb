require 'database_cleaner'
RSpec.configure do |config|
  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation, { except: %w[email_templates] }
  end

  config.before(:each, :database) do
    DatabaseCleaner.start
  end

  config.after(:each, :database) do
    DatabaseCleaner.clean
  end
end
