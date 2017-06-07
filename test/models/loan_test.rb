require 'test_helper'

class LoanTest < ActiveSupport::TestCase
  test "check profit calculations" do
    loan = Loan.create(body: 100, payments: [30, 30, 30, 30])
    assert_equal loan.profit, 20
  end
end
