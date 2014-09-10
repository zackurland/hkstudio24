class Rental < ActiveRecord::Base
  has_many :items, class_name: "RentalItem"

  validates :production_name, :production_company, :billing_name, :billing_address, :billing_city, :billing_state, :billing_country, :billing_zip_code,
  :designer_name, :designer_email, :designer_phone_number, presence: true

  accepts_nested_attributes_for :items

  validates :start_date, :end_date, presence: true

  def contact_name
    filled_out_by_designer? ? designer_name : filled_out_name
  end

  def extract_items(cart)
    self.status = "pending"
    self.start_date = cart.rental_start_date
    self.end_date = cart.rental_end_date
    cart.items.each do |item|
      rental_item = RentalItem.new
      rental_item.status = "pending"
      rental_item.product_id = item.product_id
      rental_item.start_date = cart.rental_start_date
      rental_item.end_date = cart.rental_end_date
      self.items << rental_item
    end
    if self.save
      cart.items.destroy_all
      cart.rental_start_date = nil
      cart.rental_duration_weeks = nil
      cart.save
    end
  end

  def total
    total = Money.new(0)
    items.each do |item|
      total += item.price || item.product.price || Money.new(0)
    end
    total
  end
end
