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

ActiveRecord::Schema[7.0].define(version: 2023_01_02_153429) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gyms", force: :cascade do |t|
    t.string "name"
    t.bigint "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_gyms_on_address_id"
  end

  create_table "moves", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "initiator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "training_session_id", null: false
    t.bigint "roll_id", null: false
    t.bigint "technique_id", null: false
    t.index ["roll_id"], name: "index_moves_on_roll_id"
    t.index ["technique_id"], name: "index_moves_on_technique_id"
    t.index ["training_session_id"], name: "index_moves_on_training_session_id"
    t.index ["user_id"], name: "index_moves_on_user_id"
  end

  create_table "rolls", force: :cascade do |t|
    t.integer "duration"
    t.bigint "user_id", null: false
    t.string "opponent"
    t.bigint "training_session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_session_id"], name: "index_rolls_on_training_session_id"
    t.index ["user_id"], name: "index_rolls_on_user_id"
  end

  create_table "techniques", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "training_sessions", force: :cascade do |t|
    t.integer "duration"
    t.bigint "user_id", null: false
    t.bigint "gym_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gym_id"], name: "index_training_sessions_on_gym_id"
    t.index ["user_id"], name: "index_training_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "gym_id", null: false
    t.string "belt"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["gym_id"], name: "index_users_on_gym_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "gyms", "addresses"
  add_foreign_key "moves", "rolls"
  add_foreign_key "moves", "techniques"
  add_foreign_key "moves", "training_sessions"
  add_foreign_key "moves", "users"
  add_foreign_key "rolls", "training_sessions"
  add_foreign_key "rolls", "users"
  add_foreign_key "training_sessions", "gyms"
  add_foreign_key "training_sessions", "users"
  add_foreign_key "users", "gyms"
end
