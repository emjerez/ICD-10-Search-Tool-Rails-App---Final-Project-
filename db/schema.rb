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

ActiveRecord::Schema.define(version: 20180407214951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "codes", force: :cascade do |t|
    t.string "code_id"
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "chapter"
    t.string "section_name"
    t.text "includes"
    t.text "excludes1"
    t.text "excludes2"
    t.string "parent_id"
  end

  create_table "exclusions", force: :cascade do |t|
    t.string "type"
    t.string "description"
    t.bigint "code_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code_id"], name: "index_exclusions_on_code_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "code_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code_id"], name: "index_favorites_on_code_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "inclusion_terms", force: :cascade do |t|
    t.string "description"
    t.bigint "code_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code_id"], name: "index_inclusion_terms_on_code_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recents", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "code_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code_id"], name: "index_recents_on_code_id"
    t.index ["user_id"], name: "index_recents_on_user_id"
  end

  create_table "relationships", id: false, force: :cascade do |t|
    t.integer "parent_id"
    t.integer "child_id"
    t.index ["child_id", "parent_id"], name: "index_relationships_on_child_id_and_parent_id", unique: true
    t.index ["parent_id", "child_id"], name: "index_relationships_on_parent_id_and_child_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "exclusions", "codes"
  add_foreign_key "favorites", "codes"
  add_foreign_key "favorites", "users"
  add_foreign_key "inclusion_terms", "codes"
  add_foreign_key "recents", "codes"
  add_foreign_key "recents", "users"
end
