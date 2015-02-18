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


ActiveRecord::Schema.define(version: 20150218045002) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "craigslist_lookups", force: :cascade do |t|
    t.integer "zip"
    t.string  "zip_name"
    t.string  "craigslist_subdomain"
  end

  create_table "flags", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "highlight"
    t.text     "url"
    t.float    "score"
  end

  create_table "pages", force: :cascade do |t|
    t.string   "base_url"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "checksum"
  end

  create_table "scrapers", force: :cascade do |t|
    t.string   "url"
    t.string   "response"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "target_id"
  end

  create_table "search_queries", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.integer  "zipcode"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "targets", force: :cascade do |t|
    t.string   "name"
    t.string   "base_url"
    t.string   "sanitize_options"
    t.integer  "default_depth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usermailers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
