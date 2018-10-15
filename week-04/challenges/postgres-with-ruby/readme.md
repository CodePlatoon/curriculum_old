# Postgres with Ruby



[Connection Class](https://deveiate.org/code/pg/PG/Connection.html)


In this challenge you'll be working with a truncated version of the [College Scorecard Dataset](https://collegescorecard.ed.gov/data/documentation/).

You'll use the [pg](https://deveiate.org/code/pg/README_rdoc.html) gem to import the CSV dataset to a local database and query the database.

## Release 1: Get Familiar with the Data

Take a look at [college_data.csv](college_data.csv) and review the column names. Some of them are obvious, while others are harder to interpret. A "data dictionary" is [available](https://collegescorecard.ed.gov/data/documentation/) that will help you decipher the more cryptic columns. Note, your dataset doesn't include all of the ones available in the original dataset.

## Release 2: Basic Schema Design

Now that you're familiar with the dataset, come up with a plan to store this data in a Postgres table. Decide on which columns you'll be creating and what data types you'll use.

Create a database for this challenge and write the `CREATE TABLE` statement in a new file `create_schema.sql`.

Some requirements:

* Create only one table
* Choose more readable column names for your table than are used in the CSV file. For example, columns like `SATWR75` could be renamed to `sat_written_75_percentile`.

## Release 3: Importing with `pg`

In a new file, `import.rb`, use the `pg` gem and Ruby's [CSV](https://ruby-doc.org/stdlib-2.3.0/libdoc/csv/rdoc/CSV.html) library to parse `college_data.csv` and insert the data into your new table.

Some requirements:

* Avoid inserting duplicate records. As you iterate through the lines of the CSV file, check to see there isn't an existing record in the database for the current CSV row.
* Ensure column values are cast to the correct types (e.g. `LOCALE` should be inserted as an integer)
* Pay close attention to your handling of `NULL` values. Don't insert the string `"NULL"`.

## Release 4: Basic Queries

Create a new file `search.rb` that queries the database for matching college data, printing any matches in a human readable format.

Use the [slop](https://github.com/leejarvis/slop) gem to handle your options parsing. Add the gem to your `Gemfile`.

For this release the search program should support the following command line options & queries:

```
--name [fragment of school name]
--gender [men|women|all]
```

The `--name` option should use a case insensitive `LIKE` query. Depending on the argument's value, the `--gender` option return schools that are men only, women only or don't specify a gender.

Write your code so that it's possible to combine these two arguments as a query with multiple conditions joined by `AND`. For example:

```
ruby search.rb --name Scipps --gender women
```

> Note: User parameterized queries (`connection.exec_params`), not string interpolation!

## Release 5: Additional Queries

Now, expand on the supported search criteria. Add more command line options including but not limited to:

```
--state [abbreviation]
--avg-sat-min [score]
--avg-sat-max [score]
--grad-debt-min [amount]
--grad-debt-max [amount]
```

As before, it should be possible to combine these arguments, printing colleges that only match the combination of criteria. For example, this usage should search for schools in California that have a minimum average SAT score of 1,100 and a maximum graduation debt of $25,000:

```
ruby search --state CA --avg-sat-min 1100 --grad-debt-max 25000
```
