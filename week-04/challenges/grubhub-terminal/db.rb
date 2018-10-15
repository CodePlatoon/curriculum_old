require 'singleton'

class DB
  include Singleton

  DB_NAME = "grubhub"

  def connection
    @_connection ||= PG::Connection.open(dbname: DB_NAME)
  end
end
