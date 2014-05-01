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

ActiveRecord::Schema.define(version: 20140501042423) do

  create_table "companies", force: true do |t|
    t.string   "permalink"
    t.string   "name"
    t.string   "category_code"
    t.string   "country_code"
    t.string   "state_code"
    t.string   "region"
    t.string   "city"
    t.integer  "neo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["neo_id"], name: "index_companies_on_neo_id", unique: true, using: :btree
  add_index "companies", ["permalink"], name: "index_companies_on_permalink", unique: true, using: :btree

  create_table "investings", force: true do |t|
    t.integer  "company_id"
    t.integer  "investor_id"
    t.string   "round_type"
    t.integer  "amount",      limit: 8
    t.integer  "neo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "investings", ["neo_id"], name: "index_investings_on_neo_id", using: :btree

  create_table "investors", force: true do |t|
    t.string   "permalink"
    t.string   "name"
    t.string   "category_code"
    t.string   "country_code"
    t.string   "state_code"
    t.string   "region"
    t.string   "city"
    t.integer  "neo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "investors", ["neo_id"], name: "index_investors_on_neo_id", unique: true, using: :btree
  add_index "investors", ["permalink"], name: "index_investors_on_permalink", unique: true, using: :btree

end
