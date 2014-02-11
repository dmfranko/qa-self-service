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

ActiveRecord::Schema.define(version: 20140205153807) do

  create_table "app_users", force: true do |t|
    t.integer  "app_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "run"
    t.boolean  "view"
  end

  create_table "apps", force: true do |t|
    t.string   "name"
    t.integer  "owner"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "tags"
    t.text     "default_emails"
    t.text     "envs"
    t.string   "github_url"
    t.boolean  "mobile"
  end

  create_table "images", force: true do |t|
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "platforms", force: true do |t|
    t.string   "long_name"
    t.string   "long_version"
    t.string   "os"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", force: true do |t|
    t.integer  "run_id"
    t.integer  "app_id"
    t.integer  "test_id"
    t.float    "duration"
    t.text     "description"
    t.text     "status"
    t.text     "location"
    t.text     "exception"
    t.text     "exception_details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "screenshot"
    t.string   "ancestry"
  end

  add_index "results", ["ancestry"], name: "index_results_on_ancestry"

  create_table "runs", force: true do |t|
    t.integer  "app_id"
    t.integer  "test_id"
    t.float    "duration"
    t.text     "description"
    t.text     "notes"
    t.text     "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "browser"
    t.text     "browser_version"
    t.text     "os"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "netid"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
