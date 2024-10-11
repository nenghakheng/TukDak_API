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

ActiveRecord::Schema[7.0].define(version: 2024_10_11_155000) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "currency", limit: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_budgets_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.bigint "budget_id"
    t.string "title"
    t.string "icon"
    t.integer "tx_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_categories_on_budget_id"
  end

  create_table "receipt_items", force: :cascade do |t|
    t.bigint "transaction_id"
    t.string "item_name"
    t.integer "quantity"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transaction_id"], name: "index_receipt_items_on_transaction_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "budget_id"
    t.bigint "category_id"
    t.integer "amount"
    t.text "note"
    t.boolean "is_receipt"
    t.datetime "receipt_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_transactions_on_budget_id"
    t.index ["category_id"], name: "index_transactions_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "budgets", "users", on_delete: :cascade
  add_foreign_key "categories", "budgets", on_delete: :cascade
  add_foreign_key "receipt_items", "transactions", on_delete: :cascade
  add_foreign_key "transactions", "budgets", on_delete: :cascade
  add_foreign_key "transactions", "categories", on_delete: :cascade
end
