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

ActiveRecord::Schema.define(version: 20160211140200) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.string   "status",    default: "present"
    t.string   "message"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "date"
    t.boolean  "danger"
  end

  add_index "attendances", ["course_id"], name: "index_attendances_on_course_id", using: :btree
  add_index "attendances", ["user_id"], name: "index_attendances_on_user_id", using: :btree

  create_table "course_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
  end

  add_index "course_users", ["course_id"], name: "index_course_users_on_course_id", using: :btree
  add_index "course_users", ["user_id"], name: "index_course_users_on_user_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "image"
    t.string "phone"
    t.string "type"
  end

  add_foreign_key "attendances", "courses"
  add_foreign_key "attendances", "users"
  add_foreign_key "course_users", "courses"
  add_foreign_key "course_users", "users"
end
