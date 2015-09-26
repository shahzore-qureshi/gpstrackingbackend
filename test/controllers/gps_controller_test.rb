require 'test_helper'

class GpsControllerTest < ActionController::TestCase
  test "should get saveLocation" do
    get :saveLocation
    assert_response :success
  end

end
