class AddDisplayIndexToProducts < ActiveRecord::Migration
  def change
    add_column :products, :display_index, :integer
  end
end
