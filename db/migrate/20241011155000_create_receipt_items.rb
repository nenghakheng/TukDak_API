class CreateReceiptItems < ActiveRecord::Migration[7.0]
  def change
    create_table :receipt_items do |t|
      t.references :transaction, foreign_key: {on_delete: :cascade}
      t.string :item_name
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
