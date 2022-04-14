# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_13_231724) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "datetime", precision: nil, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.datetime "done_at", precision: nil
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "repeats", force: :cascade do |t|
    t.string "title", null: false
    t.integer "days", default: [], array: true
    t.date "hits", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_repeats_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.datetime "ended_at", precision: nil
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "auth0_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "timezone", default: "UTC"
    t.index ["auth0_id"], name: "index_users_on_auth0_id", unique: true
  end

  add_foreign_key "events", "users"
  add_foreign_key "repeats", "users"
  add_foreign_key "tasks", "users"
end
