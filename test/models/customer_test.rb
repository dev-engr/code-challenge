require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  test "valid customer" do
    customer = Customer.new(
      name: "Avery Printing", zip_code: "31221", phone: "555-112-3999", email: "connect@avery_printing.co")
    assert customer.valid?
  end

  test "invalid without name" do
    customer = Customer.new(zip_code: "31221", phone: "555-112-3999", email: "connect@avery_printing.co")
    assert_not customer.valid?
  end
end
