class AddBillingInformationToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :production_name, :string
    add_column :rentals, :production_company, :string
    add_column :rentals, :billing_name, :string
    add_column :rentals, :billing_address, :string
    add_column :rentals, :billing_address_2, :string
    add_column :rentals, :billing_city, :string
    add_column :rentals, :billing_state, :string
    add_column :rentals, :billing_country, :string
    add_column :rentals, :billing_zip_code, :string
    add_column :rentals, :designer_name, :string
    add_column :rentals, :designer_phone_number, :string
    add_column :rentals, :designer_email, :string
    add_column :rentals, :filled_out_name, :string
    add_column :rentals, :filled_out_phone_number, :string
    add_column :rentals, :filled_out_email, :string
    add_column :rentals, :filled_out_by_designer, :boolean
  end
end
