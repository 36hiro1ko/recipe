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

ActiveRecord::Schema.define(version: 20150928044614) do

  create_table "mailboxes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recipient_id"
    t.text     "message"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "read"
  end

  add_index "mailboxes", ["user_id", "recipient_id", "created_at"], name: "index_mailboxes_on_user_id_and_recipient_id_and_created_at"
  add_index "mailboxes", ["user_id"], name: "index_mailboxes_on_user_id"

  create_table "microposts", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "recipes", force: :cascade do |t|
    t.string   "recipeId"
    t.string   "recipeTitle"
    t.string   "recipeUrl"
    t.string   "mediumImageUrl"
    t.string   "recipeMaterial"
    t.string   "recipeIndication"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "recipes", ["recipeId"], name: "index_recipes_on_recipeId"

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "address"
    t.string   "profile"
    t.string   "provider"
    t.string   "uid"
    t.string   "image_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true

  create_table "words", force: :cascade do |t|
    t.string   "word"
    t.string   "image"
    t.string   "detial_page_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "instagram_id"
  end

  add_index "words", ["instagram_id"], name: "index_words_on_instagram_id"

end
