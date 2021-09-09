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

ActiveRecord::Schema.define(version: 2021_09_09_024419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "children", force: :cascade do |t|
    t.string "name"
    t.string "acronym"
    t.string "phone"
    t.string "email"
    t.string "city"
    t.string "district"
    t.string "location"
    t.string "location_description"
    t.string "post_code"
    t.integer "count_connected"
    t.bigint "manager_id"
    t.bigint "president_id"
    t.bigint "vice_president_id"
    t.bigint "secretary_id"
    t.bigint "admin_id"
    t.bigint "church_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_children_on_admin_id"
    t.index ["church_id"], name: "index_children_on_church_id"
    t.index ["manager_id"], name: "index_children_on_manager_id"
    t.index ["president_id"], name: "index_children_on_president_id"
    t.index ["secretary_id"], name: "index_children_on_secretary_id"
    t.index ["vice_president_id"], name: "index_children_on_vice_president_id"
  end

  create_table "children_faithful", id: false, force: :cascade do |t|
    t.bigint "faithful_id"
    t.bigint "child_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_children_faithful_on_child_id"
    t.index ["faithful_id"], name: "index_children_faithful_on_faithful_id"
  end

  create_table "churches", force: :cascade do |t|
    t.string "name"
    t.string "acronym"
    t.string "phone"
    t.string "email"
    t.string "country"
    t.string "city"
    t.string "post_code"
    t.string "location"
    t.text "location_description"
    t.integer "category"
    t.datetime "foundation_date"
    t.string "agrement"
    t.string "leader_name"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_churches_on_admin_id"
  end

  create_table "faithful_group", id: false, force: :cascade do |t|
    t.bigint "faithful_id"
    t.bigint "group_id"
    t.index ["faithful_id"], name: "index_faithful_group_on_faithful_id"
    t.index ["group_id"], name: "index_faithful_group_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "acronym"
    t.text "descriptor"
    t.bigint "child_id"
    t.bigint "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_groups_on_child_id"
    t.index ["manager_id"], name: "index_groups_on_manager_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "author_id"
    t.bigint "child_id"
    t.text "thumb"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mark", default: 1
    t.integer "statut", default: 1
    t.integer "state", default: 1
    t.datetime "published_at"
    t.datetime "unpublished_at"
    t.datetime "marked_to"
    t.datetime "marke_end_to"
    t.index ["author_id"], name: "index_posts_on_author_id"
    t.index ["child_id"], name: "index_posts_on_child_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "phone", null: false
    t.string "email"
    t.string "password_digest"
    t.integer "role", default: 1, null: false
    t.string "token"
    t.boolean "approved", default: false, null: false
    t.string "profession"
    t.string "nationality"
    t.string "city"
    t.string "district"
    t.text "location_description"
    t.date "birthday"
    t.string "location"
    t.text "bio"
    t.integer "matricule"
    t.text "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "children", "churches"
  add_foreign_key "children", "users", column: "admin_id"
  add_foreign_key "children", "users", column: "manager_id"
  add_foreign_key "children", "users", column: "president_id"
  add_foreign_key "children", "users", column: "secretary_id"
  add_foreign_key "children", "users", column: "vice_president_id"
  add_foreign_key "children_faithful", "children"
  add_foreign_key "children_faithful", "users", column: "faithful_id"
  add_foreign_key "churches", "users", column: "admin_id"
  add_foreign_key "faithful_group", "groups"
  add_foreign_key "faithful_group", "users", column: "faithful_id"
  add_foreign_key "groups", "children"
  add_foreign_key "groups", "users", column: "manager_id"
  add_foreign_key "posts", "children"
  add_foreign_key "posts", "users", column: "author_id"
end
