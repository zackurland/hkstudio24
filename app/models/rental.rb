class Rental < ActiveRecord::Base
  has_many :items, class_name: "RentalItem"

  validates :production_name, :production_company, :billing_name, :billing_address, :billing_city, :billing_state, :billing_country, :billing_zip_code,
  :designer_name, :designer_email, :designer_phone_number, presence: true

  accepts_nested_attributes_for :items

  validates :start_date, :end_date, presence: true

  def contact_email
    filled_out_by_designer ? designer_email : filled_out_email
  end

  def contact_name
    filled_out_by_designer? ? designer_name : filled_out_name
  end

  def contact_phone_number
    filled_out_by_designer ? designer_phone_number : filled_out_phone_number
  end

  def dates
    "#{start_date.strftime("%m/%d/%y")} - #{end_date.strftime("%m/%d/%y")}"
  end

  def extract_items(cart)
    cart.items.each do |item|
      RentalItem.create(rental: self, status: "pending", product: item.product, start_date: start_date, end_date: end_date)
    end
    cart.clear!
  end

  def total
    total = Money.new(0)
    items.each do |item|
      total += item.price || item.product.price || Money.new(0)
    end
    total
  end
end
