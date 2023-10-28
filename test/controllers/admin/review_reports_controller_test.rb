require "test_helper"

class Admin::ReviewReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_review_reports_index_url
    assert_response :success
  end
end
