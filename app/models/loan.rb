class Loan < ApplicationRecord
  validates :body, :payments, :term, :profit, :profit_rate, presence: true
  validates :body, :term, :profit, :profit_rate, numericality: { greater_than: 0 }
  validate :check_payments_type

  before_validation :set_profit_and_profit_rate

  private

  def check_payments_type
    unless payments.is_a?(Array)
      errors.add(:payments, 'Payments argument should be an array')
    end
  end

  def find_payments_sum
    payments.is_a?(Array) ? payments.sum : 0
  end

  def set_profit_and_profit_rate
    self.profit = find_payments_sum - body
    self.profit_rate = profit / body * 12 / term
  end
end
