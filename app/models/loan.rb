class Loan < ApplicationRecord
  validates :body, :payments, :profit, presence: true
  validates :body, :profit, numericality: { greater_than: 0 }
  validate :check_payments_type

  before_validation :set_profit

  private

  def check_payments_type
    if !payments.is_a?(Array)
      errors.add(:payments, 'Payments argument should be an array')
    end
  end

  def find_payments_sum
    payments.is_a?(Array) ? payments.sum : 0
  end

  def set_profit
    self.profit = find_payments_sum - body
  end
end
