require "pg"
require_relative "../config"

RSpec.configure do |config|
  config.before(:each) do
    DB.instance.connection.exec("DELETE FROM players")
    DB.instance.connection.exec("DELETE FROM teams")
  end
end
