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

ActiveRecord::Schema.define(version: 20170115023812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string   "manufacturer",                            null: false
    t.string   "model",                                   null: false
    t.string   "category",                                null: false
    t.text     "description"
    t.integer  "price_cents",               default: 0,   null: false
    t.float    "rating",                    default: 0.0, null: false
    t.integer  "volume_discount_percent"
    t.integer  "volume_discount_threshold"
    t.string   "color"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["model"], name: "index_products_on_model", unique: true, using: :btree
  end

end
