class CreateCompaniesAndCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :companies_and_customers, id: false do |t|
      t.references :company, foreign_key: true
      t.references :customer, foreign_key: true
    end
  end
end
