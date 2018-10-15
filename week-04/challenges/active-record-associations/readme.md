# Active Record Associations

Now that you have some familiarity with reading and validating records from the database with Active Record, it's time to explore of one Active Record's most popular features: associations.

In this challenge you'll be using the following associations:

* `has_many`
* `has_many through:`
* `belongs_to`
* `has_one`

## Model Attributes

This challenge is focused on the modeling the relationships between models, not the models themselves. For that reason unnecessary model attributes are not considered part of this challenge. For example an `Actor` model would likely have `first_name` and `last_name` columns as part of the `actors` table. But in this challenge you only need create the necessary `id` & foreign key columns like `movie_id`.

> In short, the only migration method you'll need for this challenge is `t.belongs_to`

## Example

A simple schema for the website [IMDB](http://imdb.com) which catalogs movies and the actors has been created for you as an example.

This schema includes three models:

* Actor
* Role
* Movie

Review the schema migration file: `db/migrate/20170119134125_create_imdb.rb` and the models in `app/models`.

The `Role` model joins `Movie` and `Actor.` Via this join model, a movie has many actors and an actor can act in many movies.

An Rspec test that validates the association is available as well: `spec/models/associations_spec.rb`.

Create and migrate the database with the rake tasks and then ensure the spec passes.

Before continuing, make sure you clearly understand the example.

In each release you'll will create:
* a migration with the required tables and columns
* model classes
* model associations

You'll find each release in a subdirectory of this challenge with a single Rspec suite that tests that your associations are working as expected.

## Release 1: Medium

### Models
* Post
* User
* Comment

### Association Methods
```ruby
post.user # the author of the post
post.comments

user.posts
user.comments

comment.user
comment.post
```

## Release 2: Amazon

### Models
* Shop
* Product
* Review
* User

### Association Methods
```ruby
shop.owner # should return a User
shop.products # products sold by this shop
shop.reviews # reviews for products sold by this shop

product.shop
product.reviews
product.reviewers # should return the users who have reviewed this product

review.product
review.user

user.reviewed_products
user.shop # if this user owns a shop, returns the shop. For most users this would return nil.
```

## Release 3: Uber Eats

### Models
* Order
* OrderItem (a join model that links orders and menu items)
* MenuItem (e.g. burrito or cesar salad)
* User (customers)
* Driver (employees of Uber Eats)


### Association Methods
```ruby
order.order_items
order.menu_items
order.driver
order.customer # returns a User

driver.orders
driver.customers # returns the Users they are delivering orders to

order_item.order
order_item.menu_item

menu_item.orders # all the orders this MenuItem was 

user.orders
user.order_items
user.menu_items
```

