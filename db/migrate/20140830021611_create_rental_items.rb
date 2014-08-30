class CreateRentalItems < ActiveRecord::Migration
  def change
    create_table :rental_items do |t|
    	t.integer :request_id
    	t.integer :product_id
    	t.integer :price_in_cents
    	t.datetime :start_date
    	t.datetime :end_date
    	t.string :status
      	t.timestamps
    end
  end
end

