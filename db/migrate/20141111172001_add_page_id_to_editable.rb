class AddPageIdToEditable < ActiveRecord::Migration
  def change
    add_column :editables, :page_id, :integer
  end
end
