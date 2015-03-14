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

ActiveRecord::Schema.define(version: 20150314091637) do

  create_table "friends", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "age"
    t.integer  "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "uid"
    t.integer  "user_id"
  end

  add_index "friends", ["user_id"], name: "index_friends_on_user_id"

  create_table "funds", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "gift_id"
    t.integer  "friend_id"
    t.text     "description"
    t.integer  "situation"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "funds", ["friend_id"], name: "index_funds_on_friend_id"
  add_index "funds", ["gift_id"], name: "index_funds_on_gift_id"
  add_index "funds", ["user_id"], name: "index_funds_on_user_id"

  create_table "gifts", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.string   "image"
    t.integer  "gender"
    t.integer  "min_age"
    t.integer  "max_age"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.string   "image"
    t.string   "gender"
    t.string   "birthday"
    t.integer  "age"
    t.string   "token"
    t.string   "contact"
  end

end
