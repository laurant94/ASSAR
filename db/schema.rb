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

ActiveRecord::Schema.define(version: 2021_08_24_174649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "children", force: :cascade do |t|
    t.string "name"
    t.string "acronym"
    t.string "country"
    t.string "city"
    t.string "phone"
    t.string "email"
    t.string "location"
    t.string "location_descriptor"
    t.string "post_code"
    t.bigint "president_id"
    t.bigint "vice_president_id"
    t.bigint "secretary_id"
    t.bigint "manager_id"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "church_id"
    t.index ["admin_id"], name: "index_children_on_admin_id"
    t.index ["church_id"], name: "index_children_on_church_id"
    t.index ["manager_id"], name: "index_children_on_manager_id"
    t.index ["president_id"], name: "index_children_on_president_id"
    t.index ["secretary_id"], name: "index_children_on_secretary_id"
    t.index ["vice_president_id"], name: "index_children_on_vice_president_id"
  end

  create_table "children_user", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "child_id"
    t.bigint "faithful_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_children_user_on_child_id"
    t.index ["faithful_id"], name: "index_children_user_on_faithful_id"
  end

  create_table "churches", force: :cascade do |t|
    t.string "name"
    t.string "acronym"
    t.integer "category"
    t.string "phone"
    t.datetime "foundation_date"
    t.string "agrement"
    t.string "leader_name"
    t.string "country"
    t.string "city"
    t.string "location"
    t.text "location_descriptor"
    t.string "email"
    t.string "post_code"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_churches_on_admin_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "phone"
    t.string "email"
    t.string "firstname"
    t.string "lastname"
    t.string "password_digest"
    t.integer "role", default: 1, null: false
    t.string "activated", default: "f"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profession"
    t.boolean "approved"
  end

  add_foreign_key "children", "churches"
  add_foreign_key "children", "users", column: "admin_id"
  add_foreign_key "children", "users", column: "manager_id"
  add_foreign_key "children", "users", column: "president_id"
  add_foreign_key "children", "users", column: "secretary_id"
  add_foreign_key "children", "users", column: "vice_president_id"
  add_foreign_key "children_user", "children"
  add_foreign_key "children_user", "users", column: "faithful_id"
  add_foreign_key "churches", "users", column: "admin_id"
end
