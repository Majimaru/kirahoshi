require "test_helper"

class Admin::ReviewControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_review_show_url
    assert_response :success
  end
end
