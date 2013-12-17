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

ActiveRecord::Schema.define(version: 20131215044535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: true do |t|
    t.string   "access_token"
    t.integer  "users_id",                            null: false
    t.date     "expires_at",   default: '2014-12-16'
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaigns", force: true do |t|
    t.string  "name"
    t.date    "date"
    t.integer "user_id"
  end

  create_table "campaigns_recipients", force: true do |t|
    t.integer "campaign_id",  null: false
    t.integer "recipient_id", null: false
  end

  create_table "contact_us", force: true do |t|
    t.string "name",    null: false
    t.string "email",   null: false
    t.text   "comment", null: false
  end

  create_table "email_templates", force: true do |t|
    t.integer  "campaign_id"
    t.string   "name"
    t.text     "body"
    t.date     "published_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipients", force: true do |t|
    t.string   "email",      null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.integer  "phone"
  end

  add_index "recipients", ["user_id"], name: "index_recipients_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.integer  "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "last_name"
    t.string   "first_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", using: :btree

end
