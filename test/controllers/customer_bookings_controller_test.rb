require 'test_helper'

class CustomerBookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_bookings_index_url
    assert_response :success
  end

end
