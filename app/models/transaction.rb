class Transaction < ApplicationRecord
  belongs_to :budget
  belongs_to :category
  has_many :receipt_items, dependent: :destroy
end