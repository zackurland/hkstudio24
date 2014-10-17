class AddDiscountAndIncludeTaxToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :discount_percentage, :integer
    add_column :rentals, :include_tax, :boolean
  end
end
