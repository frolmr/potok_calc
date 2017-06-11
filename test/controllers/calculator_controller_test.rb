require 'test_helper'

class CalculatorControllerTest < ActionDispatch::IntegrationTest
  test 'should return success response status' do
    post '/calculate_profit', params: { invest_sum: '1000' }, xhr: true
    assert_response :success
  end
end
