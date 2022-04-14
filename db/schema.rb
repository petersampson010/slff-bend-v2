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

ActiveRecord::Schema[7.0].define(version: 2022_03_25_145935) do
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

  create_table "gameweeks", primary_key: "gameweek_id", id: :serial, force: :cascade do |t|
    t.string "date", null: false
    t.string "opponent", null: false
    t.string "score"
    t.integer "gameweek", null: false
    t.boolean "complete", null: false
    t.integer "admin_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", primary_key: "message_id", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "msg", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_gameweek_joiners", primary_key: "pg_id", id: :serial, force: :cascade do |t|
    t.integer "minutes"
    t.integer "assists"
    t.integer "goals"
    t.integer "own_goals"
    t.integer "y_cards"
    t.integer "r_cards"
    t.integer "bonus"
    t.integer "penalty_miss"
    t.integer "goals_conceded"
    t.integer "total_points"
    t.integer "player_id", null: false
    t.integer "gameweek_id", null: false
    t.integer "admin_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", primary_key: "player_id", id: :serial, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "position", null: false
    t.float "price", null: false
    t.string "availability", null: false
    t.integer "admin_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name", "last_name", "admin_user_id"], name: "index_players_on_first_name_and_last_name_and_admin_user_id", unique: true
  end

  create_table "records", primary_key: "record_id", id: :serial, force: :cascade do |t|
    t.boolean "sub"
    t.boolean "captain"
    t.boolean "vice_captain"
    t.integer "user_id", null: false
    t.integer "player_id", null: false
    t.integer "gameweek_id", null: false
    t.integer "admin_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_gameweek_joiners", primary_key: "ug_id", id: :serial, force: :cascade do |t|
    t.integer "total_points", null: false
    t.integer "user_id", null: false
    t.integer "gameweek_id", null: false
    t.integer "admin_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
