class AddDisplayIndexToTags < ActiveRecord::Migration
  def change
    add_column :tags, :display_index, :integer
  end
end
