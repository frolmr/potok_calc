class CalculatorController < ApplicationController
  before_action :get_current_rates

  def show
    @optimistic_percent = (@current_rates.optimistic * 100)
    @realistic_percent = (@current_rates.realistic * 100)
  end

  def calculate
    @sum = params[:invest_sum].to_f
    optimistic_profit = calculate_profit(@current_rates.optimistic)
    realistic_profit = calculate_profit(@current_rates.realistic)
    respond_to do |format|
      format.json do
        render json: { optimistic: optimistic_profit, realistic: realistic_profit }
      end
    end
  end

  private

  def get_current_rates
    @current_rates = Rate.last
  end

  def calculate_profit(rate)
    @sum * rate
  end
end
