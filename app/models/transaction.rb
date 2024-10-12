class Transaction < ApplicationRecord
  belongs_to :budget
  belongs_to :category
  has_many :receipt_items, dependent: :destroy

  def total_amount
    receipt_items.sum('price * quantity')
  end
end