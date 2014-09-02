class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :items, class_name: "CartItem"

  def has_product?(product)
    items.map(&:product_id).include?(product.id)
  end

  def request!
    rental = Rental.new
    rental.status = "pending"
    rental.start_date = rental_start_date
    rental.end_date = rental_end_date
    items.each do |item|
      rental_item = RentalItem.new()
      rental_item.status = "pending"
      rental_item.product_id = item.product_id
      rental_item.start_date = rental_start_date
      rental_item.end_date = rental_end_date
      rental.items << rental_item
    end
    if rental.save
      items.destroy_all
      self.rental_start_date = nil
      self.rental_end_date = nil
      self.save
    end
  end
end
