class Customer < ApplicationRecord
  has_many :companies_and_customers

  validates :name, :zip_code, :phone, :email, presence: true

  has_rich_text :description
end
