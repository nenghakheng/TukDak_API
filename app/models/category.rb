class Category < ApplicationRecord
  belongs_to :budget
  has_many :transactions, dependent: :destroy
end