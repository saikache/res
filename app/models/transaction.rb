class Transaction < ApplicationRecord
  belongs_to :user

  validates :t_type, inclusion: { in: %w(debit credit) }  # transaction type
end
