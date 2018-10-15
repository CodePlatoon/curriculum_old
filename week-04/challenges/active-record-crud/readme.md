# Active Record Queries

In this challenge you'll be practicing querying the database using the real [ActiveRecord](http://guides.rubyonrails.org/active_record_basics.html), not your "beta" implementation.

You'll be working with a single model, `Product`. The database schema has already been created for you. Start the challenge by creating the test database and running migrations to create your tables & columns:

```
$ rake db:drop APP_ENV=test
$ rake db:create APP_ENV=test
$ rake db:migrate APP_ENV=test
```

Fortunately, multiple rake tasks can be combined into a single command:

```
$ rake db:drop db:create db:migrate APP_ENV=test
```

> We specify `APP_ENV=test` because we're going to be working with the test database, not in the development console.

You goal is to get all the tests passing:

```
rspec spec/product_crud_spec.rb
```

The `ProductCrud` class has a number of methods for you to implement. As you work, follow the spec file & review the method names carefully. Every method can be implemented with ActiveRecord alone.