class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :dimensions
      t.integer :cost_in_cents
      t.timestamps
    end
  end
end
