require "test_helper"

class Admin::PostReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_post_reports_index_url
    assert_response :success
  end
end
