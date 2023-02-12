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

ActiveRecord::Schema[7.0].define(version: 2023_02_12_163644) do
  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "address"
    t.string "purifier_brand"
    t.integer "purifier_stages"
    t.boolean "putifier_pump"
    t.integer "purifier_tank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "installations", force: :cascade do |t|
    t.date "date"
    t.float "pressure"
    t.integer "incoming_tds"
    t.integer "out_tds"
    t.text "notes"
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_installations_on_client_id"
  end

  create_table "services", force: :cascade do |t|
    t.date "date"
    t.string "replaced"
    t.float "pressure"
    t.integer "incoming_tds"
    t.integer "out_tds_before"
    t.integer "out_tds_after"
    t.date "next_date"
    t.integer "client_id", null: false
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_services_on_client_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.datetime "datetime"
    t.integer "installation_id", null: false
    t.integer "service_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["installation_id"], name: "index_tickets_on_installation_id"
    t.index ["service_id"], name: "index_tickets_on_service_id"
  end

  add_foreign_key "installations", "clients"
  add_foreign_key "services", "clients"
  add_foreign_key "tickets", "installations"
  add_foreign_key "tickets", "services"
end
