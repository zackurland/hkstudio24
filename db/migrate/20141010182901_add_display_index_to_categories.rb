class AddDisplayIndexToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :display_index, :integer
  end
end
