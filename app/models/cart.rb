class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :items, class_name: "CartItem"

  def clear!
    self.items.destroy_all
    self.rental_start_date = nil
    self.rental_duration_weeks = nil
    self.save
  end

  def has_product?(product)
    items.map(&:product_id).include?(product.id)
  end

  def rental_end_date
    rental_start_date + rental_duration_weeks.weeks
  end
end
