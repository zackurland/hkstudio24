class AddTaxPercentageToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :tax_percentage, :string
  end
end
