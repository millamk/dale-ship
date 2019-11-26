require 'test_helper'

class RolesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get roles_new_url
    assert_response :success
  end

end
