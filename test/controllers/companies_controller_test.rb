require "test_helper"

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @company = companies(:hometown_painting)
  end

  test "CompaniesController#index returns 200 OK status code when companies exist." do
    get companies_path
    assert_response :success
  end

  test "CompaniesController#index lists company names as urls." do
    get companies_path
    assert_select "a[class='list-group-item list-group-item-action']" do |elements|
      assert_equal(elements.count, 6)
      assert_equal(elements[0].text.strip, companies(:hometown_painting)[:name])
      assert_equal(elements[1].text.strip, companies(:wolf_painting)[:name])
      assert_equal(elements[2].text.strip, companies(:thompson_patining)[:name])
      assert_equal(elements[3].text.strip, companies(:armstrong_painting)[:name])
      assert_equal(elements[4].text.strip, companies(:marcus_painting)[:name])
      assert_equal(elements[5].text.strip, companies(:brown_painting)[:name])
    end
  end

  test "CompaniesController#show returns 200 OK status code for any company" do
    get company_path(@company)
    assert_response :success
  end

  test "CompaniesController#show returns company data" do
    get company_path(@company)
    assert_select "h1", @company.name
    assert_select "input[id=phone]" do |elements|
      assert_equal(elements[0]["value"], @company.phone)
    end
  end

  test "CompaniesController#new inserts the companies data in database on create." do
    count_companies_initial = Company.count
    post companies_path(@company, sample_company_data)
    assert_equal(Company.count, count_companies_initial + 1)
    company = Company.last
    assert_equal(company.name, "Some Company")
    assert_equal(company.zip_code, "91203")
    assert_equal(company.phone, "555-000-000")
    assert_equal(company.email, "abcd@xyz.com")
  end

  test "CompaniesController#new redirects to companies list page on save." do
    post companies_path(@company, sample_company_data)
    assert_redirected_to companies_path
  end

  test "CompaniesController#edit updates the companies data in database on edit." do
    count_companies_initial = Company.count
    put company_path(@company, sample_company_data)
    assert_equal(Company.count, count_companies_initial)
    @company.reload
    assert_equal(@company.name, "Some Company")
    assert_equal(@company.zip_code, "91203")
    assert_equal(@company.phone, "555-000-000")
    assert_equal(@company.email, "abcd@xyz.com")
  end

  test "CompaniesController#edit redirects to companies list page on save." do
    put company_path(@company, sample_company_data)
    assert_redirected_to companies_path
  end

  private
    def sample_company_data
      {
        'company': {
          'name': "Some Company",
          'description': "Something",
          'zip_code': "91203",
          'phone': "555-000-000",
          'email': "abcd@xyz.com"
        }
      }
    end
end
