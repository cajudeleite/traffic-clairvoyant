# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_01_184956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "destinations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "origin_destination_routes", force: :cascade do |t|
    t.bigint "origin_id", null: false
    t.bigint "destination_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["destination_id"], name: "index_origin_destination_routes_on_destination_id"
    t.index ["origin_id"], name: "index_origin_destination_routes_on_origin_id"
  end

  create_table "origins", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "percursos", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "road_cars", force: :cascade do |t|
    t.bigint "road_id", null: false
    t.string "time"
    t.integer "number_of_cars"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "day"
    t.index ["road_id"], name: "index_road_cars_on_road_id"
  end

  create_table "roads", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "stretch"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "direction"
  end

  create_table "routes", force: :cascade do |t|
    t.bigint "road_id", null: false
    t.bigint "origin_destination_route_id", null: false
    t.integer "step"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["origin_destination_route_id"], name: "index_routes_on_origin_destination_route_id"
    t.index ["road_id"], name: "index_routes_on_road_id"
  end

  create_table "trajetos", force: :cascade do |t|
    t.bigint "viagem_id", null: false
    t.bigint "percurso_id", null: false
    t.float "tempo_de_percurso"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["percurso_id"], name: "index_trajetos_on_percurso_id"
    t.index ["viagem_id"], name: "index_trajetos_on_viagem_id"
  end

  create_table "trips", force: :cascade do |t|
    t.date "date"
    t.float "time"
    t.bigint "user_id", null: false
    t.bigint "origin_destination_routes_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["origin_destination_routes_id"], name: "index_trips_on_origin_destination_routes_id"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "viagems", force: :cascade do |t|
    t.string "origem"
    t.string "destino"
    t.integer "data"
    t.integer "horario"
    t.float "tempo_total"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_viagems_on_user_id"
  end

  add_foreign_key "origin_destination_routes", "destinations"
  add_foreign_key "origin_destination_routes", "origins"
  add_foreign_key "road_cars", "roads"
  add_foreign_key "routes", "origin_destination_routes"
  add_foreign_key "routes", "roads"
  add_foreign_key "trajetos", "percursos"
  add_foreign_key "trajetos", "viagems"
  add_foreign_key "trips", "origin_destination_routes", column: "origin_destination_routes_id"
  add_foreign_key "trips", "users"
  add_foreign_key "viagems", "users"
end
