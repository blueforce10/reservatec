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

ActiveRecord::Schema.define(version: 20150825085845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dayoffs", force: :cascade do |t|
    t.text     "day",        default: [],              array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "localizations", force: :cascade do |t|
    t.string   "state"
    t.string   "division"
    t.string   "campus"
    t.string   "building"
    t.integer  "floor"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "capacity"
    t.decimal  "cost"
    t.text     "goods",           default: [],              array: true
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "status"
    t.integer  "category_id"
    t.integer  "role_id"
    t.integer  "dayoff_id"
    t.integer  "localization_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "places", ["category_id"], name: "index_places_on_category_id", using: :btree
  add_index "places", ["dayoff_id"], name: "index_places_on_dayoff_id", using: :btree
  add_index "places", ["localization_id"], name: "index_places_on_localization_id", using: :btree
  add_index "places", ["role_id"], name: "index_places_on_role_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.datetime "startdate"
    t.datetime "enddate"
    t.text     "guest"
    t.integer  "status"
    t.string   "userapproved"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "reservable_id"
    t.string   "reservable_type"
  end

  add_index "reservations", ["reservable_type", "reservable_id"], name: "index_reservations_on_reservable_type_and_reservable_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "role"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "stuffs", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "cuantity"
    t.float    "cost"
    t.integer  "status"
    t.integer  "role_id"
    t.integer  "dayoff_id"
    t.integer  "localization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "stuffs", ["dayoff_id"], name: "index_stuffs_on_dayoff_id", using: :btree
  add_index "stuffs", ["localization_id"], name: "index_stuffs_on_localization_id", using: :btree
  add_index "stuffs", ["role_id"], name: "index_stuffs_on_role_id", using: :btree

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "places", "categories"
  add_foreign_key "places", "dayoffs"
  add_foreign_key "places", "localizations"
  add_foreign_key "places", "roles"
  add_foreign_key "reservations", "users"
  add_foreign_key "stuffs", "dayoffs"
  add_foreign_key "stuffs", "localizations"
  add_foreign_key "stuffs", "roles"
  add_foreign_key "users", "roles"
end
