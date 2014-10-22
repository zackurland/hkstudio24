class AddDurationWeeksToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :duration_weeks, :integer
  end
end
