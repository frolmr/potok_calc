require 'test_helper'

class LoansCreateTest < ActionDispatch::IntegrationTest
  test 'create action should return correct status on request' do
    post '/api/loans', params: { loan: { body: 1000, payments: [400, 400, 400] } }
    assert_response :success
  end

  test 'create action should create record with correct values' do
    body = 500
    payments = [200, 400]
    post '/api/loans', params: { loan: { body: body, payments: payments } }
    created_loan = Loan.last
    assert_equal [body, payments], [created_loan.body, created_loan.payments]
  end

  test 'create action should increase number of post records' do
    assert_difference 'Loan.count', 1 do
      post '/api/loans', params: { loan: { body: 100, payments: [60, 60] } }
    end
  end
end
