require "test_helper"

class CompaniesAndCustomerTest < ActiveSupport::TestCase
  test "valid relation" do
    company = Company.new(
      name: "Wolf Painting", zip_code: "30301", phone: "555-808-8888", email: "wolf_painting@wolf_painting.com")
    customer = Customer.new(
      name: "Avery Printing", zip_code: "31221", phone: "555-112-3999", email: "connect@avery_printing.co")
    companies_and_customers_relation = CompaniesAndCustomer.new(company: company, customer: customer)
    assert companies_and_customers_relation.valid?
  end

  test "invalid relation if customer doesnt exist" do
    company = Company.new(
      name: "Wolf Painting", zip_code: "30301", phone: "555-808-8888", email: "wolf_painting@wolf_painting.com")
    companies_and_customers_relation = CompaniesAndCustomer.new(company: company)
    assert_not companies_and_customers_relation.valid?
  end

  test "invalid relation if company doesnt exist" do
    customer = Customer.new(
      name: "Avery Printing", zip_code: "31221", phone: "555-112-3999", email: "connect@avery_printing.co")
    companies_and_customers_relation = CompaniesAndCustomer.new(customer: customer)
    assert_not companies_and_customers_relation.valid?
  end
end
