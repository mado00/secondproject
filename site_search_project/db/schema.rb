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

ActiveRecord::Schema.define(version: 20150728013846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_bookmarks", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "category_bookmark_id"
    t.integer  "bookmark_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "favorites", ["bookmark_id"], name: "index_favorites_on_bookmark_id", using: :btree
  add_index "favorites", ["category_bookmark_id"], name: "index_favorites_on_category_bookmark_id", using: :btree

  create_table "results", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.string   "image"
    t.string   "map_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "search_id"
  end

  add_index "results", ["search_id"], name: "index_results_on_search_id", using: :btree

  create_table "searches", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "searches", ["user_id"], name: "index_searches_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "favorites", "bookmarks"
  add_foreign_key "favorites", "category_bookmarks"
  add_foreign_key "results", "searches"
  add_foreign_key "searches", "users"
end
