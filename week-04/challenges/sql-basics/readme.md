# SQL Basics

For the most part you'll interact with your database by executing SQL statements. SQL (Structured Query Language) isn't quite a language like Ruby is (it lacks typical features like variables, loops, branching, etc.) but it has its own syntax, we'll need to learn.

Each database has subtle differences in their implementation of SQL, but we can expect all database servers to support the following commands:

**SELECT**  
Query one or more tables for rows that match specified criteria.

**INSERT**  
Add new rows to existing tables.

**UPDATE**  
Change column values of any rows that match specified criteria.

**DELETE**  
Delete rows that match specified criteria.

**CREATE**  
Create new tables.

**DROP**  
Delete entire tables from the database.

Other commands like those used to list the current database's tables or a tables schema are usually unique to the database you're using. We'll explore some of these commands as they're implemented in Postgres.

Perhaps unsurprisingly, `SELECT` is by far the most common SQL command and also the one that has the most number of options.

In this challenge you're going to:

1. Create a database
2. Write SQL to create a schema (tables)
3. Inspect your schema
4. Insert new records from a provided set of seed data
5. Verify seed records were inserted with the `SELECT` SQL command


## Create a Database
Postgres supports multiple databases. So when we interact with the server, we'll need to specify which database we want to connect to. Before that though, we need to create our database. Postgres comes with a command for this:

```
$ createdb [DBNAME]
```

Create a database named `school`. Confirm it exists by connecting to it with the `psql` command and listing the tables with the `\d` command. You should see output like so:

```
$ psql school
psql (9.6.1, server 9.4.5)
Type "help" for help.

school=# \d
No relations found.
```

`No relations found.`. That's expected though, we don't have any tables yet.


## Create Your Schema

Before we can insert data, we're going to need to define our schema. One important point we need to cover before we create our tables: primary keys. While it's not required for a table to have a primary key, it's extremely useful when linking records between tables. One example of this "linking" is the `address_id` column of the `students` table. Primary keys are guaranteed to be unique, which makes them perfect as identifiers when linking rows across tables.

We'll be designing **all** of our tables with an incrementing integer as a primary key. Sometimes you might be tempted to use another column as a primary key (like a social security number for a person or ISBN number for a book), but it's always a better choice to have an independent "internal" primary identifier. It's also one less choice to make -- just always create an `id` column as primary key.

Remember our table design from the prep reading? Convert each of these to a `CREATE TABLE` statement. The `students` table statement has already been written for you. Give thought to which column type you choose and whether or not a column can have a blank (NULL) value.

Postgres supports a number of different column types. Here's a summary of the most common ones:


description | column type
--- | --- |
integer numbers from -2^31 to 2^31 | INTEGER |
fractional number | DECIMAL |
variable length strings from 1-255 characters | VARCHAR([1-255]) |
fixed length string | CHARACTER(length) |
longer strings, up to 16KB | TEXT |
date, no time| DATE |
date with time | TIMESTAMP |


Add the missing `CREATE TABLE` statements to the included `create_schema.sql`. You can run this file of SQL commands on your local postgres sever like so:

```
$ psql school < create_schema.sql
```

> `psql` is a command line interface to connect to your Postgres server. The `<` is a shell redirect, passing along the contents of the file `create_schema.sql` to the `psql` program.

```sql
DROP TABLE IF EXISTS students;
CREATE TABLE students (
  id           serial PRIMARY KEY,
  first_name   varchar(255) NOT NULL,
  last_name    varchar(255) NOT NULL,
  birthdate    date NOT NULL,
  address_id   integer
);
```

Some notes:

* `serial` is a special column type provided by Postgres. It creates an integer column whose value is automatically set to the next number in sequence (starting at zero). This way each record has a unique `id` value that we don't need to set ourselves.
* It's not necessary to specify `NOT NULL` for primary keys. They are `NOT NULL` by default.
* I've allowed `address_id` to be `NULL` since we might not know the address of a student.

Here are the other tables you need to write the `CREATE TABLE` statements for:

**addresses** |
--- |
id |
line_1 |
city |
state |
zipcode |


**classes** |
--- |
id |
name |
credits |

**enrollments** |
--- |
id |
student_id |
class_id |
grade |


Remember you can load your schema with the following command:

```
$ psql school < create_schema.sql
```

It's easy to make a typo as you write your SQL, so test loading your schema as you write it (load the schema often!).

###Test your schema

Before we load some seed data, login to the postgres server with `psql` and inspect the tables you've created. Here's an example terminal session of inspecting the schema of the `students` table:

```
$ psql school
psql (9.6.1, server 9.4.5)
Type "help" for help.

school=# \d students;
                                   Table "public.students"
   Column   |          Type          |                       Modifiers
------------+------------------------+-------------------------------------------------------
 id         | integer                | not null default nextval('students_id_seq'::regclass)
 first_name | character varying(255) | not null
 last_name  | character varying(255) | not null
 birthdate  | date                   | not null
 address_id | integer                |
Indexes:
    "students_pkey" PRIMARY KEY, btree (id)
```

Use the postgres `\d` command to inspect all of your tables.

### Inserting Data

If your schema looks correct, try running the included SQL file `seed_data.sql` using `psql`. This will seed your database with student, address, class & enrollment records. Running this script should produce output like this (without any errors):

```
$ psql school < seed_data.sql
INSERT 0 1
INSERT 0 1
INSERT 0 1
...
```

If you've chosen the wrong types for any of your columns or forgot a column, you'll probably see some errors when running the seeds. Address these issues by modifying & reloading your schema.

If the seeds run successfully, connect to your database again and use the `SELECT` command to quickly inspect all the records in your database (one select per table). Here's an example:

```
school=# SELECT * FROM students;
 id | first_name | last_name | birthdate  | address_id
----+------------+-----------+------------+------------
  1 | Tianna     | Lowe      | 1985-02-17 |          1
  2 | Elda       | Sipes     | 1989-08-03 |          2
  3 | Jed        | Kunde     | 1987-01-22 |          3
  4 | Leopold    | Towne     | 1984-10-07 |
  5 | Andre      | Rohan     | 1989-09-01 |          4
(5 rows)
```

Run the same select command against all of your tables and make sure you see the same records listing in `seed_data.sql`.
