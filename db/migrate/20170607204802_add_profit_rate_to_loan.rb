class AddProfitRateToLoan < ActiveRecord::Migration[5.1]
  def change
    add_column :loans, :profit_rate, :decimal, default: 0.0
  end
end
