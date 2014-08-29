module CartManager
  extend ActiveSupport::Concern

  included do
    helper_method :current_cart
    hide_action :current_cart
  end

  def current_cart(force_create=nil)
    @current_cart ||= begin
      @user_cart = user_cart || (create_cart! if force_create)
      @user_cart || current_or_guest_user.build_cart
    end
  end

  private

  def create_cart!
    Cart.new.tap do |cart|
      cart.user = current_or_guest_user
      cart.save
    end
  end

  def user_cart
    @user_cart = current_or_guest_user.cart
  end
end
