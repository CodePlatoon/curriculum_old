APP_ENV = ENV["APP_ENV"] || "development"
# While this app doesn't use Rails, the active_migration
# gem uses RAILS_ENV when saving ActiveRecord metadata in
# the `ar_internal_metadata` table. To keep things consistent
# we set RAILS_ENV to match our own APP_ENV
ENV['RAILS_ENV'] = APP_ENV

# Fixtures are located in fixtures/, not the default location
# test/fixtures
ENV['FIXTURES_PATH'] = "fixtures"

# Add the root path to the app to the load path
$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/..")

require "active_record"
require_relative "./initializers/database"

Dir.glob("app/models/*rb").each do |model_file|
  require model_file
end
