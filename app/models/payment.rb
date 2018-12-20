# Model representing persistable payment record
class Payment < ApplicationRecord
  validates :amount, presence: true, numericality: true
  validates :currency, presence: true,
    format: { with: /[A-Z]{3}/, message: 'is not in ISO currency format' }
end
