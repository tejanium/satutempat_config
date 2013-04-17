require 'satutempat_config'
require 'database_cleaner'

RSpec.configure do |config|
  config.before :suite do
    DatabaseCleaner[:mongoid].clean_with :truncation
    DatabaseCleaner[:mongoid].strategy = :truncation
  end

  config.after :each do
    DatabaseCleaner[:mongoid].clean
  end
end
