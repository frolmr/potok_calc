class CalculatorController < ApplicationController
  before_action :get_current_rates

  def show
    @optimistic_percent = (@optimistic_rate * 100)
    @realistic_percent = (@realistic_rate * 100)
  end

  def calculate
    @sum = params[:invest_sum].to_f
    optimistic_profit = calculate_profit(@optimistic_rate)
    realistic_profit = calculate_profit(@realistic_rate)
    respond_to do |format|
      format.json do
        render json: { optimistic: optimistic_profit, realistic: realistic_profit, realistic_percent: @realistic_rate * 100 }
      end
    end
  end

  private

  def get_current_rates
    update_cached_values_if_expired
    @optimistic_rate = OPTIMISTIC_RATE
    @realistic_rate = Rails.cache.read("realistic_rate")
  end

  def calculate_profit(rate)
    @sum * rate
  end

  def update_cached_values_if_expired
    unless Rails.cache.exist?("realistic_rate") && Rails.cache.exist?("loans_count")
      Rails.cache.fetch("realistic_rate", expires_in: 24.hours) { Loan.average(:profit_rate) }
      Rails.cache.fetch("loans_count", expires_in: 24.hours) { Loan.count }
    end
  end
end
