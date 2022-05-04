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

ActiveRecord::Schema[7.0].define(version: 2022_05_02_101613) do
  create_table "observation_session_observations", force: :cascade do |t|
    t.integer "observation_session_id", null: false
    t.integer "observation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["observation_id"], name: "index_observation_session_observations_on_observation_id"
    t.index ["observation_session_id"], name: "index_observation_session_observations_on_observation_session_id"
  end

  create_table "observation_sessions", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer "user_id", null: false
    t.integer "observations_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["observations_id"], name: "index_observation_sessions_on_observations_id"
    t.index ["user_id"], name: "index_observation_sessions_on_user_id"
  end

  create_table "observations", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "observation_session_observations", "observation_sessions"
  add_foreign_key "observation_session_observations", "observations"
  add_foreign_key "observation_sessions", "observations", column: "observations_id"
  add_foreign_key "observation_sessions", "users"
end
