class Rental < ActiveRecord::Base
  has_many :items, class_name: "RentalItem"
  has_one :pdf, as: :assetable

  validates :production_name, :production_company, :billing_name, :billing_address, :billing_city, :billing_state, :billing_country, :billing_zip_code,
  :designer_name, :designer_email, :designer_phone_number, presence: true

  validates :your_name, :your_email, :your_phone_number, presence: true, if: :form_not_filled_out_by_designer?

  validate :items_have_prices, if: :approved?

  accepts_nested_attributes_for :items, :pdf, allow_destroy: true

  validates :start_date, :end_date, presence: true

  def approved?
    status == "approved"
  end

  def contact_email
    filled_out_by_designer ? designer_email : your_email
  end

  def contact_name
    filled_out_by_designer? ? designer_name : your_name
  end

  def contact_phone_number
    filled_out_by_designer ? designer_phone_number : your_phone_number
  end

  def dates
    "#{start_date.strftime("%m/%d/%y")} - #{end_date.strftime("%m/%d/%y")}"
  end

  def discount
    if discount_percentage.to_i > 0
      total * discount_percentage.to_i / 100
    else
      Money.new(0)
    end
  end

  def duration_type
    if duration_weeks == 2
      "short_rental"
    else
      "production_rental"
    end
  end

  def duration_type_name
    if duration_weeks == 2
      "Short Rental"
    else
      "Production Rental"
    end
  end

  def extract_items(cart)
    cart.items.each do |item|
      RentalItem.create(rental: self, status: "pending", product: item.product, start_date: start_date, end_date: end_date)
    end
    cart.clear!
  end

  def rental_period_in_days
    ((end_date - start_date) / 86400).round
  end

  def pending?
    status == "pending"
  end

  def reject!
    update_attributes({status: "rejected"})
  end

  def rejected?
    status == "rejected"
  end

  def tax
    if include_tax?
      total * 0.09
    else
      Money.new(0)
    end
  end

  def total
    unless defined? @total
      @total = Money.new(0)
      items.each do |item|
        @total += item.price || item.suggested_price || Money.new(0)
      end
    end
    @total
  end

  def total_with_additions
    subtotal = total
    subtotal -= discount
    subtotal += tax
    subtotal
  end

  private

  def form_filled_out_by_designer?
    filled_out_by_designer == "1"
  end

  def form_not_filled_out_by_designer?
    !filled_out_by_designer?
  end

  def items_have_prices
    prices_are_missing = false
    items.each do |item|
      if !item._destroy && item.price_cents.nil?
        prices_are_missing = true
      end
    end

    if prices_are_missing
      errors.add(:items, "need to have a price")
    end
  end
end
