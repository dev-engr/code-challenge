require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  test "valid company" do
    company = Company.new(
      name: "Wolf Painting", zip_code: "30301", phone: "555-808-8888", email: "wolf_painting@wolf_painting.com")
    assert company.valid?
  end

  test "invalid without name" do
    company = Company.new(zip_code: "30301", phone: "555-808-8888", email: "wolf_painting@wolf_painting.com")
    assert_not company.valid?
  end
end
