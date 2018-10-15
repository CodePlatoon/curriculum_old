ENV["APP_ENV"] = "test"

require "rspec"
require 'database_cleaner'
require_relative "../config/app"
require "active_record/fixtures"

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

def load_fixtures
  fixtures_dir = "#{File.dirname(__FILE__)}/../fixtures"

  # The use of String#[] here is to support namespaced fixtures.
  fixture_files = Dir["#{fixtures_dir}/**/*.yml"].map { |f| f[(fixtures_dir.size + 1)..-5] }
  ActiveRecord::FixtureSet.create_fixtures(fixtures_dir, fixture_files)
end

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation, except: %w(ar_internal_metadata)
  end

  config.around(:each) do |example|
    load_fixtures

    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
