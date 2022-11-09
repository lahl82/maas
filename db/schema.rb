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

ActiveRecord::Schema[7.0].define(version: 2022_11_09_192728) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_v1_allocations", force: :cascade do |t|
    t.bigint "api_v1_block_id", null: false
    t.bigint "api_v1_week_id", null: false
    t.bigint "api_v1_technician_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "api_v1_contract_id", null: false
    t.index ["api_v1_block_id"], name: "index_api_v1_allocations_on_api_v1_block_id"
    t.index ["api_v1_contract_id"], name: "index_api_v1_allocations_on_api_v1_contract_id"
    t.index ["api_v1_technician_id"], name: "index_api_v1_allocations_on_api_v1_technician_id"
    t.index ["api_v1_week_id"], name: "index_api_v1_allocations_on_api_v1_week_id"
  end

  create_table "api_v1_availables", force: :cascade do |t|
    t.bigint "api_v1_block_id", null: false
    t.bigint "api_v1_week_id", null: false
    t.bigint "api_v1_technician_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "api_v1_contract_id", null: false
    t.index ["api_v1_block_id"], name: "index_api_v1_availables_on_api_v1_block_id"
    t.index ["api_v1_contract_id"], name: "index_api_v1_availables_on_api_v1_contract_id"
    t.index ["api_v1_technician_id"], name: "index_api_v1_availables_on_api_v1_technician_id"
    t.index ["api_v1_week_id"], name: "index_api_v1_availables_on_api_v1_week_id"
  end

  create_table "api_v1_blocks", force: :cascade do |t|
    t.integer "hour"
    t.bigint "api_v1_day_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_v1_day_id"], name: "index_api_v1_blocks_on_api_v1_day_id"
  end

  create_table "api_v1_contracts", force: :cascade do |t|
    t.string "name"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_v1_days", force: :cascade do |t|
    t.string "name"
    t.bigint "api_v1_contract_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_v1_contract_id"], name: "index_api_v1_days_on_api_v1_contract_id"
  end

  create_table "api_v1_technician_associations", force: :cascade do |t|
    t.bigint "api_v1_technician_id", null: false
    t.bigint "api_v1_contract_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_v1_contract_id"], name: "index_api_v1_technician_associations_on_api_v1_contract_id"
    t.index ["api_v1_technician_id"], name: "index_api_v1_technician_associations_on_api_v1_technician_id"
  end

  create_table "api_v1_technicians", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_v1_weeks", force: :cascade do |t|
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "api_v1_allocations", "api_v1_blocks"
  add_foreign_key "api_v1_allocations", "api_v1_technicians"
  add_foreign_key "api_v1_allocations", "api_v1_weeks"
  add_foreign_key "api_v1_availables", "api_v1_blocks"
  add_foreign_key "api_v1_availables", "api_v1_technicians"
  add_foreign_key "api_v1_availables", "api_v1_weeks"
  add_foreign_key "api_v1_blocks", "api_v1_days"
  add_foreign_key "api_v1_days", "api_v1_contracts"
  add_foreign_key "api_v1_technician_associations", "api_v1_contracts"
  add_foreign_key "api_v1_technician_associations", "api_v1_technicians"
end
