class CustomersController < ApplicationController
  before_action :set_company
  before_action :set_customer, except: [:index, :create, :new]

  def index
    @customers = @company.customers.all
  end

  def new
    @customer = Customer.new
  end

  def show
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      CompaniesAndCustomer.new(company: @company, customer: @customer).save
      redirect_to company_customers_path, notice: "Saved"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to company_customers_path, notice: "Saved"
    else
      render :edit
    end
  end

  private
    def customer_params
      params.require(:customer).permit(
        :name,
        :description,
        :zip_code,
        :phone,
        :email
      )
    end

    def set_company
      @company = Company.find(params[:company_id])
    end

    def set_customer
      @customer = Customer.find(params[:id])
    end
end
