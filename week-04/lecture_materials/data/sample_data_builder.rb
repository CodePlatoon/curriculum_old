#!/usr/bin/env ruby

require 'pg'
require 'sequel'
require 'ffaker'

DB = Sequel.connect adapter: 'postgres', database: 'phonebook'

DB.execute <<-SQL
  create table contacts (
    name varchar not null,
    phone varchar not null
  );
SQL

1000.times do
  DB[:contacts].insert name: FFaker::Name.name, phone: FFaker::PhoneNumber.short_phone_number
end

# Dump with: pg_dump --no-owner --no-acl --column-inserts phonebook > contacts.sql
