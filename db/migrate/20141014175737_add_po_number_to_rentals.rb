class AddPoNumberToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :po_number, :string
  end
end
