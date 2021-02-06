class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.text :description
      t.string :zip_code
      t.string :phone
      t.string :email
    end
  end
end
