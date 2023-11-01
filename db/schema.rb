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

ActiveRecord::Schema[7.1].define(version: 2023_11_01_111706) do
  create_table "Invoice", primary_key: "Bill_Id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "PO_Number"
    t.string "Part Number", limit: 45
    t.integer "Quantity Deliverred"
    t.date "Delivery Date"
    t.index ["PO_Number", "Part Number"], name: "Part_Number_idx"
  end

  create_table "Order", primary_key: ["PO Number", "Part Number"], force: :cascade do |t|
    t.integer "PO Number", null: false
    t.string "Part Number", limit: 45, null: false
    t.string "Part Description", limit: 45
    t.string "Division Delivery", limit: 45
    t.integer "Quantity"
    t.decimal "Unit Price", precision: 5, scale: 2
    t.string "CGST", limit: 45
    t.string "Sgst", limit: 45
  end

  create_table "Schedule", primary_key: "ScheduleId", id: :integer, default: nil, force: :cascade do |t|
    t.integer "PO_Number", null: false
    t.string "Part_Number", limit: 45
    t.date "ScheduleDate"
    t.integer "ScheduleQty"
    t.index ["PO_Number", "Part_Number"], name: "PO_number_idx"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "PO Number", null: false
    t.string "Part Number", limit: 45, null: false
    t.string "Part Description", limit: 45
    t.string "Division Delivery", limit: 45
    t.integer "Quantity"
    t.decimal "Unit Price", precision: 5, scale: 2
    t.string "CGST", limit: 45
    t.string "Sgst", limit: 45
    t.index ["PO Number", "Part Number"], name: "index_po_number_part_number_on_orders"
  end

  add_foreign_key "Invoice", "Order", column: ["PO_Number", "Part Number"], primary_key: ["PO Number", "Part Number"], name: "Part_Number"
  add_foreign_key "Schedule", "Order", column: ["PO_Number", "Part_Number"], primary_key: ["PO Number", "Part Number"], name: "PO_number"
end
