class ProductsController < ApplicationController
  def index
    @categories = Category.order(:display_index)
    @tag_ids = []
    if params[:q].present?
      @tag_ids += params[:q].values.flatten
      @products = Product.filter(params[:q])
    else
      @products = Product.includes(:tags).uniq
    end
    @products = @products.order(:display_index).paginate(page: params[:page], per_page: 20)
  end
end
