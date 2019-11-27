require 'test_helper'

class Carriers::ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get carriers_profiles_edit_url
    assert_response :success
  end

end
