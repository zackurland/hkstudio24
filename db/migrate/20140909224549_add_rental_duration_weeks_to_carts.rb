class AddRentalDurationWeeksToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :rental_duration_weeks, :integer
    remove_column :carts, :rental_end_date
  end
end
