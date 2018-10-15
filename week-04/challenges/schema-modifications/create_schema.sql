DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    id serial PRIMARY KEY,
    first text,
    last text,
    social varchar(255),
    account_number varchar(255),
    line_1 varchar(255),
    city varchar(255),
    state varchar(255),
    zip integer,
    current_balance_cents integer
);

DROP TABLE IF EXISTS statements;
CREATE TABLE statements (
    id serial PRIMARY KEY,
    customer_id integer,
    gallons_used integer,
    cents_per_gallon integer,
    start_date date,
    end_date date,
    status varchar(255),
    payment_date date,
    due_date date,
    amount_due_cents integer,
    min_amount_due_cents integer
);
