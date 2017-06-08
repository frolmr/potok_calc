require 'test_helper'

class RateTest < ActiveSupport::TestCase
  test "check realistic rate calculations" do
    Loan.create(body: 1000, term: 6, payments: [170, 170, 170, 170, 170, 195])
    assert_equal rates(:rate).realistic, 0.05
  end
end
