class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :items, class_name: "CartItem"

  def has_product?(product)
    items.map(&:product_id).include?(product.id)
  end
end
