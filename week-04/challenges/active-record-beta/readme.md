# ActiveRecord Beta

Get ready to step back in time, to December of 2006. Living a few hours in the shoes of David Heinemeier Hansson known as [dhh](https://github.com/dhh) who around that time wrote and released the first version of Ruby on Rails.

More than just a web framework, Ruby on Rails also shipped with a library called ActiveRecord. ActiveRecord made connecting to an RDBMS and performing SQL queries a breeze. It blurred the lines between the models (code) and the tables and rows of a database so much that the database just faded into the background. Still there, but concealed behind Ruby classes that could seemingly do everything*.

In this challenge you'll create a barebones implementation of the ActiveRecord pattern. In a later challenge you'll begin using the ActiveRecord library as it ships today.

The models from the GrubHub challenge included a few of ActiveRecord's features, so parts of this challenge will feel familiar. Other parts of this challenge will probably stretch your brain!


> Some would say "do everything" to its detriment. ActiveRecord classes pack a lot of functionality and there are competing patterns that split responsibilities into multiple classes. See the datamapper pattern as an example.

## Overview

In your GrubHub challenge you created classes that followed the sprit of the ActiveRecord pattern. Classes like `Restaurant` that both modeled a restaurant in Ruby but also held code that interacted with a database. Class methods like `Restaurant.find(id:)` fall right in line with the ActiveRecord pattern.

You probably noticed the repetition as you created different classes that connected to the database. E.g.

```ruby
require 'db'

class Restaurant
  TABLE_NAME = "restaurants"

  def self.find(id:)
    row = connection.exec_params("SELECT * from #{TABLE_NAME} WERE id = $1")[0]
    raise "Not found"  if row.nil?

    new(attributes: attributes)
  end

  def initialize(attributes:)
    @attributes = attributes
  end

  private

  # The DB class provides a connection to the database
  def connection
    DB.instance.connection
  end
end

class Order
  TABLE_NAME = "orders"

  def self.find(id:)
    row = connection.exec_params("SELECT * from #{TABLE_NAME} WERE id = $1")[0]
    raise "Not found"  if row.nil?

    new(attributes: attributes)
  end

  def initialize(attributes:)
    @attributes = attributes
  end

  private

  # The DB class provides a connection to the database
  def connection
    DB.instance.connection
  end
end
```
Looking at these two classes, notice how they're **nearly identical**. In fact, the other differences are the name of the classes and the value of the constant `TABLE_NAME`.

Our goal in this challenge is to create a class `ActiveRecord` that provides the basic functionality to connect to a database. Each of our models will inherit from this new class. When we're done, our `Restaurant` and `Order` class would look like this:

```ruby
class Restaurant < ActiveRecord
end

class Order < ActiveRecord
end
```

No more duplicated code, but still plenty of functionality provided by the new `ActiveRecord` class:

```ruby
restaurant = Restaurant.find(id: 1)
orders = Order.find_by(restaurant_id: restaurant.id)
```

## Release 1: `find`

Your first step is to create a "find by id" finder method (as a class method):

```
find(id:)
```

In this challenge, we'll be working with two different tables & classes, `Player` and `Team`. Take a quick look at the schema provided in `create_schema.sql`.

You'll need to write one method that works equally well for both classes (since both the `Player` and `Team` class will inherit from your `ActiveRecord` class.

Create the `find` method in your `ActiveRecord` class. It should work similarly to the `.find` methods included in the `Restaurant` & `Order` examples.

There are tests provided this release, you can run them like so:

```
rspec spec/models/v1/
```

Open the spec files (in the `v1/` subdirectory) to review what exactly is being tested.

### Tips
Because of inheritance the same `.find` class method will be used when you run `Player.find` and `Team.find`. So you'll need to make parts of your finder method dynamic.

## Release 2: Column Types

With your `.find` method working you can turn a particular row in the database into a Ruby object. You're well on your way to creating your own Object-Relation Mapping (ORM).

But you might have noticed that the values of `@attributes` don't match the column types of the database:

```ruby
{
  "id" => "1",
  "first_name" => "Sarah",
  "last_name" => "Onion",
  "position" => "center",
  "team_id" => "2"
}
```

Every value is a string! `id` and `team_id` should both be integers if we want to faithfully represent the row as a Ruby object.

If `table_name` was our first bit of magic, we're going to take this to the next level. You challenge is to dynamically convert the string values you receive from your `SQL` query to the proper Ruby objects. When you're done, the `@attributes` hash for the same player object should hold these values:

```ruby
{
  "id" => 1,
  "first_name" => "Sarah",
  "last_name" => "Onion",
  "position" => "center",
  "team_id" => 2
}
```

Keep in mind, this needs to work with any new class that inherits from ActiveRecord. This particular feature of the ActiveRecord was _a big deal_ when it launched back in 2006. Other ORM libraries at the time required their users to maintain a configuration file (often in XML -- blech!) that described the type of each column. ActiveRecord skipped this step by using the database's schema as the source of truth for this configuration. You'll take the same approach.

This part of the challenge requires some creative thinking, don't give up!

### Tips

#### Schema Query
To get this working you'll need to ask the database to describe the schema for a particular table. This way you'll know that `id` should be an integer and `first_name` a string. You can fetch the schema for any table with this SQL query:

```sql
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name='players'
```

Notice that the table name is specified in the query, you'll need to make that part dynamic of course. Run the query so you're familiar with the results.

#### Casting
Once you've retrieved the type for each column with the schema query, you'll want to use the column/type mapping to cast (aka convert) the string values from your `find` query to their correct Ruby objects.

Write a method to convert the `attributes` hash and call it from your `initialize` method so that the `@attributes` instance variable has the converted values (e.g. `team.id == 1`)

As you write your solution, run the specs for this release of the challenge, review the spec files if you're unsure how to proceed.

```
rspec spec/models/v2/
```

## Release 3: Getters

It's a bit clumsy to access the attributes of a record via the `attributes` hash. Instead of `team.attributes["name"]`, wouldn't it be nicer to write `team.name`?

That's your goal for this section of the challenge.

Spend a few minutes brainstorming with your pair on how you might accomplish this feat. Your models will need to respond messages (another name for a method call in Ruby lingua franca) for any key in the `@attributes` variable. E.g., the following should work:

```ruby
player = Player.find(id: 1)
player.id
=> 1
player.first_name
=> "Sarah"
player.birthdate
=> #<Date: 1985-04-11>
```

Keep in mind all the code you write should live in `active_record.rb`.

Like the other parts of this challenge, there are tests run:

```
rspec spec/models/v2/
```

### Tips
Struggling on how to approach this problem? Take a look at `method_missing`.

## Release 4: Setters

Now that you can "get" attributes for a model via a method call, add the ability to set a value as well. Here's an example of what we have in mind:

```
player.name
=> "Sarah"
player.name = "Mike"
=> "Mike"
player.attributes
=> {"id" => 1, "first_name" => "Mike", "last_name" => "Onion"}
```

As you write your code verify it's working as expected with the v4 tests:

```
rspec spec/models/v4/
```

### Tip
Remember that in Ruby setter method is called with some syntactic sugar. `person.name = "Mary"` is actually calling the a setter method `name=` with the argument `"Mary"`. The `=` is actually part of the method name, for example:

```ruby
class Person
  # getter
  def name
    @name
  end

  # setter
  def name=(new_name)
    @name = new_name
  end
end
```

## Release 5: Saving

You're almost done! Now to take this ActiveRecord class full circle: saving.

Write a `.save` method that either saves an existing record or creates a new record.

Your aim is to get the tests passing:

```
rspec spec/models/v5/
```

## All Done!

Congrats on making it this far! While our ActiveRecord implementation isn't anywhere near as feature rich as the version that ships today, you've managed to implement the most important parts.

By creating your own "baby" version of ActiveRecord you've got a much clearer picture of how an ORM really works under the hood. That understanding will help you make sense of the real ActiveRecord library we'll be learning in the next challenge.

