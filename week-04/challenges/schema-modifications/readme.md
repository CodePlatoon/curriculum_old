# Schema Modifications

Database schemas reflect the current approach to solving a problem. Over time, the problem or the solution are bound to change.

While it's preferable to modify application code instead of schema changes, a schema that doesn't fit the current understanding of the problem can cause all sorts of problems downstream:

* duplication of data
* incorrect stored values (e.g. if the column type is incorrect)
* complicated or non-intutive code
* interfaces that don't match how a user perceives the problem
* limitations that prevent users from fully harnessing the application

In this challenge you don't have to consider any existing application code, but schema changes often require careful coordination with application code. You're task is to update an existing schema that has a few bugs and limitations. You'll be renaming columns, changing column types and adding missing constraints.

## Current Schema

You're working with the city's water department database. There are two tables, `customers` and `statements`. Statements are effectively the bill a customer receives each month.

### customers
column | type |
----------|-------|
id | integer, auto increment |
first | text |
last | text |
social | varchar(255) |
account_number | varchar(255) |
line_1 | varchar(255) |
city | varchar(255) |
state | varchar(255) |
zip | varchar(255) |
current\_balance\_cents | integer

### bills
column | type |
-------|------|
id | integer, auto increment |
customer_id | integer |
gallons_used | integer |
cents\_per\_gallon | integer |
start_date | date |
end_date | date |
status | varchar(255) |
payment_date | date |
due_date | date |
amount\_due\_cents | integer |
min\_amount\_due\_cents | integer |


## Check everything!
Make sure that when you enter your database that you see everything you want to see.

## Modifications

Save your schema migration to a new file, `migrations.sql`. Write SQL statements to make the following modifications:

### customers

1. Both columns `first` and `last` have ambiguous names. Rename them to `first_name` and `last_name`.
2. Because the current column type of `first` and `last` are `text`, these columns have almost no limit to how much content they can store. We've noticed garbage registrations with first and last names over 20kb! Change the column types of these to a varchar with a max of 255 characters.
3. The `social` column also has some dirty data, some customers have entered their social with dashes, others without, others with spaces. We've decided to store only the numbers of a users social. Which means all `social` values should be exactly 9 characters. Change the column type to allow only 9 characters.
4. The `account_number` column has the same issue, the city's account numbers are 14 characters. Update the column type.
5. Someone forgot to add a `line_2` column, add one.
6. The 'zip` column is currently an integer, but we're loosing digits from customers with zip codes that start with zeros. Change the column type appropriately.
7. Remove the `current_balance_cents` column. It was added for performance reasons, but there's a bug in the application code and it's often out of date.

### statements

1. The `customer_id` column allows null values, change it so a value is required.
2. We've updated our water meters and we can accurately measure fractional gallons. Update `gallons_used` to allow for two decimal places.
3. Add a default value "payment_due" to `status`.

### Final Steps
Add your migration file into your database. Does it change your schema? Are the columns and tables updated? What do you notice about the relationship between migrations and the original SQL file? 