class RentalItem < ActiveRecord::Base
  monetize :price_cents, allow_nil: true

  belongs_to :rental
  belongs_to :product

  def suggested_price
    product.send(:"#{rental.duration_type}_price")
  end

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
