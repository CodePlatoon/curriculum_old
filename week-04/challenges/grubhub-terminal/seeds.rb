require 'faker'
require 'pg'

module Seeds
  DB_NAME = "grubhub"

  class Restaurant
    TABLE_NAME = "restaurants"

    # Create a restaurant and return the new row
    def self.create
      ::Seeds.connection.exec_params("INSERT INTO #{table_name} (name) VALUES ($1) RETURNING *", [Faker::Company.name]).first
    end

    # Select & return all rows in the restaurants table
    def self.all
    end
  end

  class MenuItem
    TABLE_NAME = "menu_items"

    # Create & return a menu item for particular restaurant
    def self.create(restaurant_id)
    end

    # Return all menu item rows for a particular restaurant
    def self.all(restaurant_id)
    end
  end

  def self.connection
    @_connection ||= PG::Connection.open(dbname: DB_NAME)
  end
end

if __FILE__ == $PROGRAM_NAME
  3.times do
    Seeds::Restaurant.create.tap do |restaurant|
      rand(5..15).times do
        Seeds::MenuItem.create(restaurant["id"].to_i)
      end
    end
  end

  Seeds::Restaurant.all.each do |row|
    p row
  end
end
