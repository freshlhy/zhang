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

ActiveRecord::Schema.define(version: 20150204004614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string   "dept1st"
    t.string   "dept2nd"
    t.string   "dept3rd"
    t.integer  "type_id"
    t.integer  "brand_id"
    t.string   "model"
    t.date     "commissioning"
    t.string   "asset_number"
    t.integer  "value"
    t.string   "fund_source"
    t.string   "factory_number"
    t.date     "production_date"
    t.integer  "department_id"
    t.string   "user"
    t.string   "user_phone"
    t.string   "location"
    t.string   "ip"
    t.string   "mac"
    t.string   "os"
    t.string   "note"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "maintenancers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maintenances", force: :cascade do |t|
    t.integer  "device_id"
    t.date     "mdate"
    t.string   "location"
    t.integer  "maintenancer_ids", default: [],              array: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
