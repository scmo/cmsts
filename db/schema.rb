# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160308201419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "measurements", id: :bigserial, force: :cascade do |t|
    t.integer  "station_id",                    null: false
    t.integer  "value_type_id",                 null: false
    t.datetime "measured_at",                   null: false
    t.float    "measured_value",                null: false
    t.boolean  "active",         default: true
  end

  add_index "measurements", ["active"], name: "measurements_active_index", using: :btree
  add_index "measurements", ["id"], name: "measurements_id_index", using: :btree

  create_table "stations", force: :cascade do |t|
    t.text "name",     null: false
    t.text "details"
    t.text "location"
  end

  create_table "stations_value_types", id: false, force: :cascade do |t|
    t.integer "station_id",    null: false
    t.integer "value_type_id", null: false
  end

  add_index "stations_value_types", ["station_id", "value_type_id"], name: "index_stations_value_types_on_station_id_and_value_type_id", using: :btree
  add_index "stations_value_types", ["value_type_id", "station_id"], name: "index_stations_value_types_on_value_type_id_and_station_id", using: :btree

  create_table "tempImport", id: false, force: :cascade do |t|
    t.text "stn"
    t.text "measured_at"
    t.text "measured_value"
  end

  create_table "value_types", force: :cascade do |t|
    t.text "name",    null: false
    t.text "details"
    t.text "unit"
  end

  add_foreign_key "measurements", "stations"
  add_foreign_key "measurements", "value_types"
  add_foreign_key "stations_value_types", "stations"
  add_foreign_key "stations_value_types", "value_types"
end
