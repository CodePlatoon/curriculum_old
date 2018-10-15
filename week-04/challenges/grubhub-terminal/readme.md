# GrubHub Terminal

In this challenge you'll be creating a terminal interface for a restaurant that offers delivery via GrubHub.

Start with the schema you designed and ensure it supports the following use cases:

* A restaurant's menu items
* Recording orders. Including which menu items were ordered, total price, customer information, delivery details, special requests, etc.
* Marking an order as delivered or picked up.
* Ability to calculate basic statistics, including but not limited to
  * which menu items were most popular
  * total order volume in the last n-days
  * most hungry customers
  * average delivery fulfillment time (from order placement to pickup or delivery)

You might not be able to implement all of these use cases as SQL queries, but you should have the data available to do so. We'll fill in any blanks with Ruby code.

## Schema

Write the SQL to generate the schema you need in a `create_tables.sql` file. Remember to drop your tables before creating them. This way you can re-run the `create_tables.sql` script if you make a change to your schema.

## Seed Data

Like the school database challenge, we're going to seed our database with some sample data. Instead of writing SQL by hand, write some Ruby to seed the database. Plan on seeding data for every table in your schema.

To help with the task try using the [Faker gem](https://github.com/stympy/faker). It has built-in generators for all kinds of fake data. For example:

```
> Faker::Food.ingredient
=> "Vegetable Stock"
> Faker::Name.first_name
=> "Dameon"
```

A template for your seed script is provided, see `seeds.rb`. Follow the same pattern as you write code to see all your tables.

Remember to connect tables with foreign keys as you generate your seed data.

While developing `seeds.rb`, you might find it convenient to start with a fresh database each time you test your code, you can do this on the cmd line by combining two commands with an `&&`. When connecting command line programs with `&&` the next one in line won't run unless the first runs successfully:

```
psql < create_tables.sql && ruby seeds.rb
```

When your seed script is complete, inspect your database's contents to ensure everything is as you expect.

## Release 1: Viewing Orders

Your first goal is to support the most important feature for any restaurant using your software: viewing orders.

Start a new file named `restaurant.rb`. This file will contain a Ruby class that represents a restaurant in our GrubHub ordering system. The `Restaurant` class will be able to find its record in the database and its orders.

Start with the following skeleton:

```ruby
require 'db'

class Restaurant
  def self.find(id:)
    # Find the matching row in the restaurants table
    data = connection.exec("QUERY")
    raise "No record found" if data.length == 0
    
    # return an instance of the Restaurant class
    self.new(data)
  end

  def initialize(data)
    @data = data
  end
  
  def orders
    # Don't worry about creating an Order class yet, just return the
    # matching rows in the orders table for this restaurant
  end
  
  private
  
  attr_reader :data
  
  # The DB class provides a connection to the database
  def connection
    DB.instance.connection
  end
end
```

Test the basics of your `Restaurant` class via `irb` to make sure it works as expected.

Next, let's create another file, `restaurant_view.rb`. This will handle the terminal input & output (input from the user and output to the screen). Name this class `RestaurantView`.

Start with the following skeleton:

```ruby
require 'restaurant'
require 'terminal_utils'

class RestaurantView
  def initialize(restaurant:)
    @restaurant = restaurant
  end
  
  def list_orders
    TerminalUtils.clear_screen
    
    puts "ORDERS"
    puts "-"*80
    # retrieve and list the restaurant's orders, one per line
    # Tip: use the tab character "\t" to help format your output
  end
  
  private
  
  attr_reader :restaurant
end
```

Finally wire everything together in another file named `grubhub.rb`. Start with this skeleton to get things working (you'll expand on this later):

```ruby
require 'restaurant_view'
require 'restaurant'
require 'terminal_utils'

TerminalUtils.clear_screen

# ARGV holds an array of the command line arguments provided when this
# script is run. Arguments are space delimited.
restaurant = Restaurant.find(id: ARGV[0])

restaurant_view = RestaurantView.new(restaurant)
restaurant_view.list_orders
```

If everything is working correctly you should see output like this:

```
$ ruby grubhub.rb
ORDERS
-------------------------------------------------------------------------
```

Try printing the orders for different restaurants to be sure everything is working as expected.

## Release 2: Login

Expecting our restaurant owners to remember their restaurant's `id` to view their orders is a bit cumbersome and not the most secure. Adding a login mechanism would be ideal.

Add two columns to the `restaurants` table: `username` and `password`. Adjust your `seeds.rb` to set these columns when creating restaurant records. For now, set the passwords for each restaurant to "password". This way you can easily login as any restaurant.

Now, instead of loading a restaurant via the `id` supplied on the command line, you need to prompt the user to login. Then try and find a matching record in the `restaurants` table. If you find a match, show their orders like you did before.

For this, create a new class `Login`. Start with this skeleton:

```ruby
require 'db'

class Login
  def self.login
    print "Username: "
    username = gets
    
    print "Password: "
    password = gets
    
    # Query for a matching restaurant record. If one is found
    # return a new Restaurant instance. If no match if found,
    # print an error message and exit the program
  end
  
  private
  
  def connection
    DB.instance.connection
  end
end
```

Incorporate your `Login` class within `grubhub.rb` so that users are prompted to login when the program runs.

## Release 3: Customer Details

Your current order display is missing some crucial information that should be available at a glance: the customer details. Without making multiple queries when finding the orders for a restaurant, add the following information to the orders display:

* customer name
* customer phone number
* pickup or delivery

Your output should look something like this when you're complete:

## Release 4: Order Details

Next, you'll add a screen that displays order details, including menu items and their quantity.

Add a new method to `RestaurantView` called `show_order(order_id:)`. It should query the database for the details from the `orders` table along with the queries you need to retrieve all of the ordered menu items and their quantity.

In order to access this screen, modify your `grubhub.rb` like so:

```ruby
restaurant_view = RestaurantView.new(restaurant)
restaurant_view.list_orders

print "Enter order id for details: "
gets = order_id
restaurant_view.show_order(id: order_id)
```

As you design the order details display, think about what the restaurant owner would expect to see.

Once that's working, add the ability to close the order details display and return back to the list of all the restaurant's orders. Listing for the user to type `q` should work great.


## Release 5: Order Update

Now that the restaurant owner can:

* login
* view all orders
* view order details

Let's add the ability to change the status of an order next. Generally, we can think of orders having a state value that changes over time. A typical state flow might be:

`received -> cooking -> cooked -> delivered or picked_up`

Using a single column to track the changing state of an object is a common practice. Often you'll create a state machine (some code dedicating to managing state transitions), but we won't take it that far in this project. We'll just need a `status` column on the `orders` table and an `UPDATE` query that can change the `status` column's value.

Add code that allows the user to change the status of an order when they are viewing the order details. Just like you listened for a `q` keypress to exit the order details view, listen for different keys to change the order's status.

Your steps to implement this feature are roughly:

1. Update your database schema. The new `status` column should not allow `NULL` values.
2. Update your `seeds.rb` to set a status when creating orders.
3. Include the status when listing orders.
4. Add code that allows a user to change the status of an order.


## Release 6: Order Delete

Sometimes a customer has a change of heart and decides to cancel an order. Add the ability to delete an order from the order details page. Be sure to also delete any related records like the list of menu items the user requested.

## Release 7: New Orders

While we don't have any way for customers to submit new orders, we can simulate them doing so by writing a separate Ruby program. Think of it like a seeding process that runs in the background.

Create a new file `customer_simulator.rb`. Start with this skeleton that re-uses code from your `seeds.rb`:

```ruby
require 'seeds'

while true do
  Seeds::Restaurant.all.each do |restaurant|
    # create one order for each restaurant. don't forget to
    # print some logging messaging, so you know it's working
  end
  
  sleep 10
end
```

If you run `customer_simulator.rb` it should insert a new order record for each restaurant every 10 seconds. You can terminate the program by typing `ctrl+c`. If you think you've done some damage to your database, remember you can start fresh by re-creating your schema and generating new seed data.

## Release 8: Auto-Refresh

Restaurant owners are busy people and orders can come in at any time. Next, modify your GrubHub terminal application so that new orders are shown without forcing the user to quit & restart the program.

Usually when you want to build an "auto-update" feature like this you have two choices:

* pushing
* polling

### Pushing
With this approach the server needs the ability to run some code anytime a change occurs (e.g. a new order is created or an old order is modified). The server also needs the ability to connect any connected clients (usually maintaining a list of persistent connections to each client). This approach is more performant than polling (no wasted queries), but more complex.

### Polling
With this approach the client asks the server on a regular interval for new data. This is the simplest approach and the one you'll be using.

### Implementation
Add a new method to your `RestaurantView` class named `stream_orders`. Following the approach you took in the `customer_simulator.rb`, use a `while` loop to constantly refresh the list of orders.

While running `customer_simulator.rb` in another terminal window you should eventually see a new order appear.


