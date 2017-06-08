class RealisticRateUpdater
  def calculate_realistic_rate
    loans = Loan.all
    sum_of_rates = 0.0
    loans.each do |loan|
      sum_of_rates += loan.profit_rate
    end
    sum_of_rates / loans.length
  end
end
