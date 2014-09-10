class ChangeCentsFields < ActiveRecord::Migration
  def change
    rename_column :products, :cost_in_cents, :price_cents
    rename_column :rental_items, :price_in_cents, :price_cents
  end
end
