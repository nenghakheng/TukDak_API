class User < ApplicationRecord
  has_many :budgets, dependent: :destroy
end
