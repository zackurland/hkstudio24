class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  validates_uniqueness_of :product_id, :scope => :cart_id
end
