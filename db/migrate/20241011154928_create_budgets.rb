class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.references :user, foreign_key: {on_delete: :cascade}
      t.string :title
      t.string :currency, limit: 3

      t.timestamps
    end
  end
end
