
1. Create database - createdb
1. Import contacts.sql
1. psql

```sql
select * from contacts;
```

- `*` means all columns

Select individual columns:

```sql
select name, phone from contacts;
```

Rows are filtered with a `where` clause.

```sql
select name
from contacts
where phone='487-845-7759';
```

Exercise: Find phone number for Pricilla Schaefer.

Now what happens if we only know someone's first name? Try to find Holly's phone number.

```sql
select name, phone
from contacts
where name like 'Holly%';
```

The `%` is the wildcard character for a `like`. It matches any number of any character.

Exercise: Find phone number for the last name of Collins.

Hmm. Which one should we choose? Maybe it would help if we sorted the results.

```sql
select name, phone
from contacts
where name like '%Collins'
order by name;
```

What if we want a case-insensitive search?

```sql
select name, phone
from contacts
where name ilike '%Collins'
order by name;
```

Now let's see how we add a new contact.

```sql
insert into contacts(name, phone) values ('John Smith', '432-422-4945');
```

Question: What happens if you don't insert both name and phone?

Begin introduction of `NULL`. `NULL` means empty (introduce the unknown nature of `NULL` later.

What if a friend changes their phone number?

```sql
update contacts
set phone='873-234-2349'
where name='Iliana Gleichner';
```

Lastly, let's delete a record.

```sql
delete from contacts where name='Theo Reynolds';
```

Notice that `select`, `update`, and `delete` all allow a `where`. It is very important to include a `where` clause on `update` and `delete` statements.

We are starting to run into a problem with how to tell rows apart. People can share names. They can also share phone numbers. We need some way uniquely identify rows. A unique identifier is called a key. The most important unique identifier is called the primary key. With very few exceptions every table should have a primary key.

```sql
alter table contacts
add column id serial,
add primary key (id);
```

It also would be nice to split name into first name and last name.

```sql
select split_part(name, ' ', 1) as first_name,
  split_part(name, ' ', 2) as last_name,
  phone
from contacts;
```

Let's make it permanent.

```sql
alter table contacts
add column first_name varchar(50),
add column last_name varchar(50);
```

```sql
update contacts
set first_name=split_part(name, ' ', 1),
  last_name=split_part(name, ' ', 2);
```

```sql
alter table contacts
drop column name,
alter column first_name set not null,
alter column last_name set not null;
```

Let's add a call log.

```sql
create table calls(
  id serial primary key,
  contact_id integer not null,
  call_time timestamptz not null default now(),
  call_duration interval not null
);
```

And insert a call record.

```sql
insert into calls(contact_id, call_duration)
values (1, '3 minutes 23 seconds');
```

Note:
  inserting default values
  serial has implicit default
  time zones are terrible
  PG types like interval are really useful

What happens if we insert a record for a non-existent contact?

```sql
insert into calls(contact_id, call_duration)
values (99999, '1 hour');
```

Yuck. Delete that record please.

PG can protect us.

```sql
alter table calls
add foreign key (contact_id) references calls(id);
```

Try insert again.

Always use foreign keys.


Next: joins, aggregates, transactions, more on null (the unknown)
