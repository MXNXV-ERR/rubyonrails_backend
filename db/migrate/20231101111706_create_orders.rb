class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
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
  end
end
