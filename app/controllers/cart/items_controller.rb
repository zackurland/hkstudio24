class Cart::ItemsController < ApplicationController
  def add
    cart_item = CartItem.new(cart_item_params)

    if cart_item.save
      render json: { id: cart_item.id, cart_id: current_cart.id, product_id: cart_item.product_id }
    else
      render json: { errors: cart_item.errors }, status: :unprocessible_entity
    end
  end

  def remove
    cart_item = current_cart.items.where(product_id: params[:item][:product_id]).last

    if cart_item
      cart_item.destroy
    end

    render nothing: true, status: :ok
  end

  private

  def cart_item_params
    params.require(:item).permit(:product_id).merge({cart_id: current_cart(true).id})
  end
end
