require "test_helper"

class CustomersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @company = companies(:hometown_painting)
    @customer = customers(:cannon_tools_co)
  end

  test "displays all customers" do
    get company_customers_path(@company)
    assert_response :success
  end

  test "displays a single customer" do
    get company_customer_path(@company, @customer)
    assert_response :success
  end
end
