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

ActiveRecord::Schema.define(version: 20140401153246) do

  create_table "app_user_permissions", force: true do |t|
    t.integer  "user_id"
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "application_default_emails", force: true do |t|
    t.string   "email_address"
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "application_environments", force: true do |t|
    t.string   "environment_name"
    t.string   "environment_url"
    t.integer  "is_environment_available"
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "application_tags", force: true do |t|
    t.string   "tag"
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apps", force: true do |t|
    t.string   "name"
    t.integer  "owner"
    t.text     "description"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "github_url"
    t.integer  "is_application_mobile", default: 0
  end

  create_table "captured_screen_images", force: true do |t|
    t.integer  "screenshot_id"
    t.text     "os"
    t.text     "browser"
    t.text     "version"
    t.text     "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "platforms", force: true do |t|
    t.integer  "test_browser_id"
    t.integer  "test_operating_system_id"
    t.integer  "is_available_in_cloud"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", force: true do |t|
    t.integer  "run_id"
    t.integer  "app_id"
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

  create_table "screenshots", force: true do |t|
    t.string   "url"
    t.string   "netid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "execution_state"
  end

  create_table "test_browsers", force: true do |t|
    t.string   "browser_name"
    t.string   "browser_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_hierarchies", force: true do |t|
    t.integer  "test_run_platforms_id"
    t.string   "ancestry"
    t.string   "test_hierarchy_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_operating_systems", force: true do |t|
    t.string   "operating_system_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_platforms", force: true do |t|
    t.integer  "test_run_id"
    t.integer  "platforms_id"
    t.datetime "test_run_platform_start_time"
    t.datetime "test_run_platform_end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_result_details", force: true do |t|
    t.integer  "test_hierarchies_id"
    t.float    "test_execution_duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "example_result"
  end

  create_table "test_result_exceptions", force: true do |t|
    t.integer  "test_result_details_id"
    t.text     "exception_text"
    t.text     "exception_debug_details"
    t.string   "exception_screenshot"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_runs", force: true do |t|
    t.string   "test_run_description"
    t.string   "test_run_note"
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "user_name"
    t.string   "netid"
    t.integer  "is_administrator", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
