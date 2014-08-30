class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
    	t.string :status
    	t.datetime :start_date
    	t.datetime :end_date
    	t.timestamps
    end
  end
end