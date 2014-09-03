class CartsController < ApplicationController
  def show
    @items = current_cart(true).items.includes(:product)
  end

  def update
    if current_cart.update_attributes(cart_params)
      render json: { id: current_cart.id }
    else
      render json: { errors: current_cart.errors }, status: :unprocessible_entity
    end
  end

  def checkout
    @items = current_cart.items.includes(:product)
  end

  def check_availabilities
    render json: { items: current_cart.items.map{|item| {id: item.id, product_id: item.product_id, available: item.available?} } }
  end

  private

  def cart_params
    params.require(:cart).permit(:rental_start_date, :rental_end_date)
  end
end
