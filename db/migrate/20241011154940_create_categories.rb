class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.references :budget, foreign_key: {on_delete: :cascade}
      t.string :title
      t.string :icon
      t.integer :tx_type

      t.timestamps
    end
  end
end
