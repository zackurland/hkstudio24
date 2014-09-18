class RentalItem < ActiveRecord::Base
  monetize :price_cents, allow_nil: true

  belongs_to :rental
  belongs_to :product

  private

  def rental_approved?
    rental.approved?
  end

  def rental_pending?
    rental.pending?
  end

  def rental_rejected?
    rental.rejected?
  end
end
