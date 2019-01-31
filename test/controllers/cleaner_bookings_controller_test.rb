require 'test_helper'

class CleanerBookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cleaner_bookings_index_url
    assert_response :success
  end

end
