require_relative "./config"
require 'singleton'
require 'pg'

class DB
  include Singleton

  def connection
    @_connection ||= PG::Connection.open(dbname: Config::DB_NAME)
  end
end
