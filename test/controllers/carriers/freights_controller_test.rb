require 'test_helper'

class Carriers::FreightsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get carriers_freights_index_url
    assert_response :success
  end

end
