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

ActiveRecord::Schema.define(version: 20140604044547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "factor_weights", force: true do |t|
    t.float "chloroform_weight",            null: false
    t.float "bromoform_weight",             null: false
    t.float "bromodichloromethane_weight",  null: false
    t.float "dibromichloromethane_wieight", null: false
  end

  add_index "factor_weights", ["chloroform_weight", "bromoform_weight", "bromodichloromethane_weight", "dibromichloromethane_wieight"], name: "index_factor_weights_unique", unique: true, using: :btree

  create_table "water_samples", force: true do |t|
    t.text  "site",                 null: false
    t.float "chloroform",           null: false
    t.float "bromoform",            null: false
    t.float "bromodichloromethane", null: false
    t.float "dibromichloromethane", null: false
  end

  add_index "water_samples", ["site"], name: "index_water_samples_on_site", unique: true, using: :btree

end
