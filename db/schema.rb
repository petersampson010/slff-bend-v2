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

ActiveRecord::Schema[7.0].define(version: 2022_03_25_115354) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", primary_key: "admin_user_id", id: :serial, force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "club_name", null: false
    t.boolean "confirm_email", default: false
    t.string "confirm_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_name"], name: "index_admin_users_on_club_name", unique: true
    t.index ["email"], name: "index_admin_users_on_email", unique: true
  end

  create_table "users", primary_key: "user_id", id: :serial, force: :cascade do |t|
    t.string "email"
    t.string "team_name", null: false
    t.string "password_digest", null: false
    t.integer "transfers"
    t.float "budget"
    t.integer "gw_start"
    t.boolean "confirm_email", default: false
    t.string "confirm_token"
    t.integer "admin_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["team_name"], name: "index_users_on_team_name", unique: true
  end

end
