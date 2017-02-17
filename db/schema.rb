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

ActiveRecord::Schema.define(version: 20170214220346) do

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "alpha_2"
    t.string "alpha_3"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  create_table "project_countries", force: :cascade do |t|
    t.integer "project_id"
    t.integer "country_id"
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
    t.string   "website"
    t.boolean  "immediate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture"
    t.string   "document"
    t.integer  "like_count"
    t.string   "contact_email"
    t.string   "contact_phone"
    t.string   "frequency"
    t.boolean  "approved",      default: false
  end

  create_table "specialties", force: :cascade do |t|
    t.string "name"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
  end

  create_table "user_institutions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "institution_id"
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
    t.text     "address"
    t.string   "city"
    t.string   "email"
    t.string   "phone_work"
    t.string   "phone_mobile"
    t.string   "fax_number"
    t.integer  "status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture"
    t.string   "password_digest"
    t.string   "state"
    t.integer  "country_id"
    t.integer  "address_type"
    t.integer  "zipcode"
    t.boolean  "admin",                  default: false
    t.string   "status_other"
    t.boolean  "approved",               default: false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "institution_other"
  end

end
