class RentalItem < ActiveRecord::Base
  monetize :price_cents

  belongs_to :rental
  belongs_to :product

  validates :price, presence: true, on: :update
end
