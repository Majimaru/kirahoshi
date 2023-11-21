require "test_helper"

class Admin::MaintenancesControllerTest < ActionDispatch::IntegrationTest
  test "should get master_tables" do
    get admin_maintenances_master_tables_url
    assert_response :success
  end
end
