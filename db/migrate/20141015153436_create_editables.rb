class CreateEditables < ActiveRecord::Migration
  def change
    create_table :editables do |t|
      t.string :name
      t.text :text
    end
  end
end
