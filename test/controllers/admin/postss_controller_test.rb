require "test_helper"

class Admin::PostssControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_postss_show_url
    assert_response :success
  end
end
