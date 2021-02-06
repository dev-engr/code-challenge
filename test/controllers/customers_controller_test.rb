require "test_helper"

class CustomersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @company = companies(:hometown_painting)
    @customer = customers(:cannon_tools_co)
    @company_with_no_customer = companies(:marcus_painting)
  end

  test "CustomersController#index returns 200 OK status code when customers exist." do
    get company_customers_path(@company)
    assert_response :success
  end

  test "CustomersController#index returns 200 OK status code when customers doesn't exist." do
    get company_customers_path(@company_with_no_customer)
    assert_response :success
  end

  test "CustomersController#index lists customer names as urls when they are existing." do
    get company_customers_path(@company)
    assert_select "a[class='list-group-item list-group-item-action']" do |elements|
      assert_equal(elements.count, 4)
      assert_equal(elements[0].text.strip, customers(:cannon_tools_co)[:name])
      assert_equal(elements[1].text.strip, customers(:west_life_insurance)[:name])
      assert_equal(elements[2].text.strip, customers(:morrison_home_federation)[:name])
      assert_equal(elements[3].text.strip, customers(:bay_bank_automobiles)[:name])
    end
  end

  test "CustomersController#index displays 'No customers' text when customers not present." do
    get company_customers_path(@company_with_no_customer)
    assert_select "p", "No Customers Found"
  end

  test "CustomersController#index doesn't show 'No customers' text when customers are present." do
    get company_customers_path(@company)
    assert_select "p", false, "No Customers Found"
  end

  test "CustomersController#show returns 200 OK status code for any customer" do
    get company_customer_path(@company, @customer)
    assert_response :success
  end

  test "CustomersController#show returns customer data" do
    get company_customer_path(@company, @customer)
    assert_select "div[class='container p-5 text-white']", @customer.name
    assert_select "input[id=phone]" do |elements|
      assert_equal(elements[0]["value"], @customer.phone)
    end
  end

  test "CustomersController#new inserts the customers data in database on create." do
    count_customers_initial = Customer.count
    count_associations_initial = CompaniesAndCustomer.count
    post company_customers_path(@company, sample_customer_data)
    assert_equal(Customer.count, count_customers_initial + 1)
    assert_equal(CompaniesAndCustomer.count, count_associations_initial + 1)
    customer = Customer.last
    assert_equal(customer.name, "Some Company")
    assert_equal(customer.zip_code, "91203")
    assert_equal(customer.phone, "555-000-000")
    assert_equal(customer.email, "abcd@xyz.com")
    assert_not_nil(CompaniesAndCustomer.find_by(customer: customer, company: @company))
  end

  test "CustomersController#new redirects to customers list page on save." do
    post company_customers_path(@company, sample_customer_data)
    assert_redirected_to company_customers_path
  end

  test "CustomersController#edit updates the customers data in database on edit." do
    count_customers_initial = Customer.count
    put company_customer_path(@company, @customer, sample_customer_data)
    assert_equal(Customer.count, count_customers_initial)
    @customer.reload
    assert_equal(@customer.name, "Some Company")
    assert_equal(@customer.zip_code, "91203")
    assert_equal(@customer.phone, "555-000-000")
    assert_equal(@customer.email, "abcd@xyz.com")
  end

  test "CustomersController#edit redirects to customers list page on save." do
    put company_customer_path(@company, @customer, sample_customer_data)
    assert_redirected_to company_customers_path(@company)
  end

  private
    def sample_customer_data
      {
        'customer': {
          'name': "Some Company",
          'description': "Something",
          'zip_code': "91203",
          'phone': "555-000-000",
          'email': "abcd@xyz.com"
        }
      }
    end
end
