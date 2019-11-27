require 'test_helper'

class Shippers::ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get shippers_profiles_edit_url
    assert_response :success
  end

end
