require "test_helper"

class Public::ReviewReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_review_reports_create_url
    assert_response :success
  end
end
