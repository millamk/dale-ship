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

ActiveRecord::Schema.define(version: 2019_12_02_174815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "shipper_id"
    t.bigint "freight_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "pending"
    t.index ["freight_id"], name: "index_bookings_on_freight_id"
    t.index ["shipper_id"], name: "index_bookings_on_shipper_id"
  end

  create_table "carriers", force: :cascade do |t|
    t.bigint "user_id"
    t.string "carrier_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "CNPJ"
    t.string "job_title"
    t.string "company_name"
    t.string "photo"
    t.index ["user_id"], name: "index_carriers_on_user_id"
  end

  create_table "freights", force: :cascade do |t|
    t.string "modal"
    t.string "origin"
    t.string "destination"
    t.date "ready_to_load"
    t.string "type_of_shipment"
    t.string "container_pack"
    t.bigint "carrier_id"
    t.date "expire_date"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_freights_on_carrier_id"
  end

  create_table "ports", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "shippers", force: :cascade do |t|
    t.bigint "user_id"
    t.string "vol_freq"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "CNPJ"
    t.string "job_title"
    t.string "company_name"
    t.string "photo"
    t.index ["user_id"], name: "index_shippers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "freights"
  add_foreign_key "bookings", "shippers"
  add_foreign_key "carriers", "users"
  add_foreign_key "freights", "carriers"
  add_foreign_key "shippers", "users"
end
