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

ActiveRecord::Schema.define(version: 20161117064225) do

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "alpha_2"
    t.string "alpha_3"
  end

  create_table "project_specialties", force: :cascade do |t|
    t.integer "project_id"
    t.integer "specialty_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "country_id"
    t.string   "website"
    t.boolean  "immediate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specialties", force: :cascade do |t|
    t.string "name"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
  end

  create_table "user_specialties", force: :cascade do |t|
    t.integer "user_id"
    t.integer "specialty_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "prefix"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "address_type"
    t.text     "address"
    t.string   "city"
    t.string   "zipcode"
    t.string   "email"
    t.string   "phone_work"
    t.string   "phone_mobile"
    t.string   "fax_number"
    t.string   "institution"
    t.integer  "status_id"
    t.boolean  "admin"
    t.string   "pictures"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end