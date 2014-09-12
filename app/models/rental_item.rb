class RentalItem < ActiveRecord::Base
  monetize :price_cents, allow_nil: true

  belongs_to :rental
  belongs_to :product
end
