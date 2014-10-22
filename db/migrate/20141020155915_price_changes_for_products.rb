class PriceChangesForProducts < ActiveRecord::Migration
  def change
    rename_column :products, :price_cents, :production_rental_price_cents
    add_column :products, :short_rental_price_cents, :integer
  end
end
