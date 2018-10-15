# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170116001609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "swim_records", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "team_name"
    t.boolean "relay"
    t.string  "stroke"
    t.integer "distance"
    t.decimal "time_in_seconds"
    t.date    "record_date"
    t.date    "record_broken_date"
    t.string  "record_level"
  end

end
