class RenameRequestIdToRentalIdOnRentalItems < ActiveRecord::Migration
  def change
    rename_column :rental_items, :request_id, :rental_id
  end
end
