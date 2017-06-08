class Rate < ApplicationRecord
  validates :optimistic, :realistic, presence: true, numericality: { greater_than_or_equal: 0 }

  before_validation :set_realistic_rate

  private

  def set_realistic_rate
    self.realistic = RealisticRateUpdater.new.calculate_realistic_rate
  end
end
