class AddDatesToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :rental_start_date, :datetime
    add_column :carts, :rental_end_date, :datetime
  end
end
