class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :budget, foreign_key: {on_delete: :cascade}
      t.references :category, foreign_key: {on_delete: :cascade}
      t.integer :amount
      t.text :note
      t.boolean :is_receipt
      t.datetime :receipt_date
      
      t.timestamps
    end
  end
end
