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

ActiveRecord::Schema[7.0].define(version: 2022_11_02_220952) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allocations", force: :cascade do |t|
    t.bigint "block_id", null: false
    t.bigint "week_id", null: false
    t.bigint "technician_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_id"], name: "index_allocations_on_block_id"
    t.index ["technician_id"], name: "index_allocations_on_technician_id"
    t.index ["week_id"], name: "index_allocations_on_week_id"
  end

  create_table "availables", force: :cascade do |t|
    t.bigint "block_id", null: false
    t.bigint "week_id", null: false
    t.bigint "technician_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_id"], name: "index_availables_on_block_id"
    t.index ["technician_id"], name: "index_availables_on_technician_id"
    t.index ["week_id"], name: "index_availables_on_week_id"
  end

  create_table "blocks", force: :cascade do |t|
    t.integer "hour"
    t.bigint "day_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_blocks_on_day_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.string "name"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "days", force: :cascade do |t|
    t.string "name"
    t.bigint "contract_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_days_on_contract_id"
  end

  create_table "technicians", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weeks", force: :cascade do |t|
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "allocations", "blocks"
  add_foreign_key "allocations", "technicians"
  add_foreign_key "allocations", "weeks"
  add_foreign_key "availables", "blocks"
  add_foreign_key "availables", "technicians"
  add_foreign_key "availables", "weeks"
  add_foreign_key "blocks", "days"
  add_foreign_key "days", "contracts"
end
