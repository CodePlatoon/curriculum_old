# SQL Queries

Now that you've got a schema created & some sample data loaded, it's time to write some more SQL queries.

In the previous challenge you made use of `CREATE TABLE`, `DROP TABLE`, `INSERT` and `SELECT`.

In this challenge you'll take a deeper dive into the following commands:

**SELECT**  
Query one or more tables for rows that match specified criteria.

**INSERT**  
Add new rows to existing tables.

**UPDATE**  
Change column values of any rows that match specified criteria.

**DELETE**  
Delete rows that match specified criteria.

You'll be executing queries against your `school` database, so make sure that's available and seeded with the sample data from the pervious challenge.

## SELECT

You used the most simple version of a `SELECT` command in the previous challenge:

```sql
SELECT * FROM table_name;
```

This returns all the rows & columns for a particular table. Selecting all the rows & columns is a bit risky though -- if our table held millions of records, retrieving them all at once might be more load than our server is prepared for.

We can reduce the amount of data we retrieve by naming the columns we want to retrieve from the database. You can specify one or more columns like so:

```sql
SELECT col1, col2, col3 FROM table_name;
```

Try retrieving only the `id`, `first_name` and `last_name` from the `students` table. You should see output like this:

```shell
 id | first_name | last_name
----+------------+-----------
  1 | Tianna     | Lowe
  2 | Elda       | Sipes
  3 | Jed        | Kunde
  4 | Leopold    | Towne
  5 | Andre      | Rohan
(5 rows)
```

Querying just these columns might be the query you'd use when building an autocomplete feature. You wouldn't need the other columns of the students table like birthdate; selecting fewer columns means a faster query and less load on your database.

### Aggregate Functions

Besides selecting particular columns, you can select aggregate values, computing from the raw values in the table. Commonly use aggregate functions include `MIN`, `MAX`, `COUNT`, `SUM` and `AVERAGE`.

Here's an example of find the worst grade from the enrollments table:

```shell
school=# SELECT MAX(grade) from enrollments;
 max
-----
 C
(1 row)
```

Try using the other aggregate functions on other columns & tables.

### WHERE Conditions

Remember our original use cases for the school database?

* Finding a student record by name instead of id number
* Listing all the students enrolled in a particular course
* Finding the number of students whose birthday is in the next month

You can solve each of these with a `SELECT` query combined with a `WHERE` clause.

The general syntax is: `SELECT * FROM table_name WHERE [column] [operator] [value];`.

Possible operators include:

operator | description | example |
------ |  ---------- | --- |
=  | equals | `SELECT * FROM students WHERE first_name = 'Andre';` |
<> | not equals | `SELECT * FROM enrollments WHERE grade <> 'A';` |
\>  | greater than | `SELECT * FROM classes WHERE credits > 2;` |
<  | less than | `SELECT * FROM enrollments WHERE grade < 'B';` |
\>= | greater than or equal to | `SELECT * FROM enrollments WHERE grade >= 'B';` |
<= | less than or equal to | `SELECT * FROM enrollments WHERE grade <= 'C';` |
BETWEEN | between values | `SELECT * FROM classes WHERE credits BETWEEN 3 AND 4;` |
LIKE | pattern match, `%` represents wildcard | `SELECT * FROM classes WHERE name like 'SPAN%';` |
IN | match against a list of values | `SELECT * FROM enrollments WHERE grade IN ('A','B');` |

When a single operator isn't enough you can combine them with `AND` and `OR`:

```sql
SELECT * FROM classes WHERE name LIKE 'ART%' AND credits > 3;

SELECT * FROM classes WHERE name LIKE 'ART%' OR credits > 3;
```

Ordering your query results is easy with `ORDER BY`:

```sql
-- Find > 3 credit classes ordered by their name in descending alpha order
SELECT * FROM classes WHERE name credits > 3 ORDER BY name DESC;

-- Find > 3 credit classes ordered by the number or credits, ascending
SELECT * FROM classes WHERE name credits > 3 ORDER BY credits ASC;
```


## JOINS

Up until now, you've only selected records from a single table at a time. Now it's time to really up your SQL game and learn how to join multiple tables together with a single query.

SQL joins come in a number of flavors, for now you'll start with the most common, an `INNER JOIN`. A join can allow us to support a pretty common use case, retrieve students and their address in a single query:

```shell
school=# SELECT * FROM students INNER JOIN addresses ON students.address_id = addresses.id;
 id | first_name | last_name | birthdate  | address_id | id |        line_1        |    city    |    state     | zipcode
----+------------+-----------+------------+------------+----+----------------------+------------+--------------+---------
  1 | Tianna     | Lowe      | 1985-02-17 |          1 |  1 | 6232 Guiseppe Courts | Jamartown  | Maryland     | 49028
  2 | Elda       | Sipes     | 1989-08-03 |          2 |  2 | 704 Cecil Mountain   | West Jon   | South Dakota | 91578
  3 | Jed        | Kunde     | 1987-01-22 |          3 |  3 | 41613 Huel Ranch     | Loycefort  | Florida      | 12109
  5 | Andre      | Rohan     | 1989-09-01 |          4 |  4 | 1397 Braden Shoals   | New Karine | New York     | 03913
(4 rows)
```

Let's dissect this query in a bit more detail:

```sql
SELECT * FROM students INNER JOIN addresses ON students.address_id = addresses.id;
```

Breaking it up into its components:

Columns to select | Starting Table | Join Type | Join Table |  How to join the tables |
--- | ---- | --- | --- | --- |
`SELECT *` | `FROM STUDENTS` | `INNER JOIN` | `addresses` | `ON students.address_id = addresses.id`

The last clause sometimes the most difficult, we need to explain to the database how we want to "connect" the different rows from each table. In this example we connect each `students` row with a single row in the `addresses` table by matching `students.address_id` with `addresses.id`. You might think of the `ON` in a join as meaning `WHEN`.

Did you notice anything unsual in the results of the query? For one thing, this query returns two columns named `id`. One is from the `students` table, while the other is from the `addresses` table. Plus we also have the `address_id` column from the `students` table, so the student's address id is printed twice. It's a bit lengthy, but we can remedy this by replacing `SELECT *` with a list of the columns we're we want to retrieve:

```sql
SELECT students.id, students.first_name, students.last_name, students.birthdate, students.address_id, addresses.line_1, addresses.city, addresses.city, addresses.state, addresses.zipcode FROM students INNER JOIN addresses ON students.address_id = addresses.id;
```

```shell
 id | first_name | last_name | birthdate  | address_id |        line_1        |    city    |    city    |    state     | zipcode
----+------------+-----------+------------+------------+----------------------+------------+------------+--------------+---------
  1 | Tianna     | Lowe      | 1985-02-17 |          1 | 6232 Guiseppe Courts | Jamartown  | Jamartown  | Maryland     | 49028
  2 | Elda       | Sipes     | 1989-08-03 |          2 | 704 Cecil Mountain   | West Jon   | West Jon   | South Dakota | 91578
  3 | Jed        | Kunde     | 1987-01-22 |          3 | 41613 Huel Ranch     | Loycefort  | Loycefort  | Florida      | 12109
  5 | Andre      | Rohan     | 1989-09-01 |          4 | 1397 Braden Shoals   | New Karine | New Karine | New York     | 03913
(4 rows)
```

We prefixed each column we select with its table name, this way there isn't any ambiguity when executing the query (required since some columns have the same name in both tables, e.g. `id`).

Notice anything else strange about our results? How many student records should there be? Check your `students` table.

Five, right? Why didn't we see Leopold Towne in our results when we joined the `addresses` table? This is because of how an `INNER JOIN` works. Here's a summary of the different join types:


Join Type  | Description |
--- | --- |
INNER  | Returns rows that have a match in **both** tables |
LEFT  | Returns **all rows from the left** table and matching rows from the right |
RIGHT | Returns **all rows from the right** table and matching rows from the left table |
FULL | Returns matching rows from the **left or right** table |

So Leopold Towne didn't show up because his `address_id` column is `NULL`. There isn't a matching row in the `addresses` table with an `address.id` of `NULL`. The type of join you use acts as a filter, controlling which rows are returned. Take this into considering when writing your queries.

Changing the query to return all the students and any matching addresses:

```sql
SELECT students.id, students.first_name, students.last_name, students.birthdate, students.address_id, addresses.line_1, addresses.city, addresses.state, addresses.zipcode FROM students LEFT JOIN addresses ON students.address_id = addresses.id;
```

```shell
 id | first_name | last_name | birthdate  | address_id |        line_1        |    city    |    state     | zipcode
----+------------+-----------+------------+------------+----------------------+------------+--------------+---------
  1 | Tianna     | Lowe      | 1985-02-17 |          1 | 6232 Guiseppe Courts | Jamartown  | Maryland     | 49028
  2 | Elda       | Sipes     | 1989-08-03 |          2 | 704 Cecil Mountain   | West Jon   | South Dakota | 91578
  3 | Jed        | Kunde     | 1987-01-22 |          3 | 41613 Huel Ranch     | Loycefort  | Florida      | 12109
  4 | Leopold    | Towne     | 1984-10-07 |            |                      |            |              |
  5 | Andre      | Rohan     | 1989-09-01 |          4 | 1397 Braden Shoals   | New Karine | New York     | 03913
(5 rows)
```

`WHERE` & `JOIN` can be combined. Let's query for students who live in Maryland, returning the student's name, city and state:

```sql
SELECT students.id, students.first_name, students.last_name, addresses.city, addresses.state FROM students INNER JOIN addresses ON students.address_id = addresses.id WHERE addresses.state = 'Maryland';
```

```shell
 id | first_name | last_name |   city    |  state
----+------------+-----------+-----------+----------
  1 | Tianna     | Lowe      | Jamartown | Maryland
(1 row)
```

## INSERT

While you've focused on reading information from the database so far, the next few query types will allow you to change information in the database.

`INSERT` queries do exactly what you'd imagine, they insert _new_ rows into a particular table.

The most explicit insert queries look like this:

Which table | Columns | Values |
--- | --- | --- |
`INSERT INTO students` | `(first_name, last_name, birthdate)` | `VALUES ('Michelle', 'Dupont', '1982-02-11')`

It's possible to forgo the list of columns if you're going to set a value for every single column in the table. But with that approach you'll need to supply the values in the same order as they appear in the table's schema. You also won't be able to rely on having the database auto-generate fields (like `id`) since you're required to supply values for columns. Given all these limitations, it's a better choice to explicitly list the columns you're providing values for.

## UPDATE

What a student needs to change their address? An `UPDATE` query allows us to do just that:

Which table | Changes | Condition |
--- | --- | --- |
`UPDATE addresses` | `SET line_1='200 Church St.' city='Barrington' state='IL' zipcode='60010'` | `WHERE id = 2`

You can set new values for as many columns as you'd like.

While our example included a condition that ensured we only updated a single record: `WHERE address_id 2`, update queries can update multiple rows at the same time. In fact, you can eliminate the condition entirely and change every column in a table, for example:

```sql
-- Everyone gets an A!
UPDATE enrollments SET grade='A';
```

## DELETE

Delete queries are written just like update queries, affecting all rows that match a condition:

Which table | Condition |
--- | --- |
`DELETE FROM addresses` | `WHERE id = 2`
