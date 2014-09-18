class ChangeFilledOutByToYour < ActiveRecord::Migration
  def change
    rename_column :rentals, :filled_out_name, :your_name
    rename_column :rentals, :filled_out_email, :your_email
    rename_column :rentals, :filled_out_phone_number, :your_phone_number
  end
end
