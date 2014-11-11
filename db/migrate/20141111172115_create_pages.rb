class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
    end
  end
end
