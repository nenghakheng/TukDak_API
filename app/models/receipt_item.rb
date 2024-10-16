class ReceiptItem < ApplicationRecord
  belongs_to :receipt_transaction, class_name: 'Transaction', foreign_key: 'transaction_id'
end