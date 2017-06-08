require 'test_helper'

class CalculatorControllerTest < ActionDispatch::IntegrationTest
  setup do
    post '/calculate_profit', params: { invest_sum: '1000' }, xhr: true
  end

  test 'should return success response status' do
    assert_response :success
  end

  test 'should return correct response message' do
    assert_equal "{\"optimistic\":\"300.0\",\"realistic\":\"310.0\"}", @response.body
  end
end
