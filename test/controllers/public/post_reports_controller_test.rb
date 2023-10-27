require "test_helper"

class Public::PostReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_post_reports_create_url
    assert_response :success
  end
end
