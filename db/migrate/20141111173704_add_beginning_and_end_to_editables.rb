class AddBeginningAndEndToEditables < ActiveRecord::Migration
  def change
    add_column :editables, :display_start, :text
    add_column :editables, :display_end, :text
  end
end
