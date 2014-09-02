class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  validates_uniqueness_of :product_id, :scope => :cart_id

  def available?
    availability = true
    rental_items = RentalItem.joins(:rental).where(rental_items: {product_id: product.id}).where.not(rentals: {status: "rejected"})
    rental_items.each do |rental_item|
      if (cart.rental_start_date - rental_item.end_date) * (rental_item.start_date - cart.rental_end_date) >= 0
        availability = false
      end
    end
    availability
  end
end
