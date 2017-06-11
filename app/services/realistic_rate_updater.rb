class RealisticRateUpdater
  def initialize(new_loan_rate)
    @new_loan_rate = new_loan_rate
    @current_realistic_rate = Rails.cache.read("realistic_rate")
    @current_loans_count = Rails.cache.read("loans_count")
  end

  def update_cache
    Rails.cache.write("realistic_rate", find_new_realistic_rate)
    Rails.cache.write("loans_count", increment_loans_count)
  end

  private

  def find_new_realistic_rate
    (@current_realistic_rate * @current_loans_count + @new_loan_rate) / increment_loans_count
  end

  def increment_loans_count
    @current_loans_count + 1
  end
end
