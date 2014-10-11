class ProductsController < ApplicationController
  def index
    @categories = Category.order(:display_index)
    @tag_ids = []
    if params[:filters].present?
      params[:filters].each do |key, value|
        @tag_ids += value
      end
      product_ids = Product.joins(:tags).where(tags: {id: @tag_ids.flatten}).group(:product_id).count.keep_if{|k, v| v >= params[:filters].count}.keys
      @products = Product.where(id: product_ids)
    else
      @products = Product.includes(:tags).order(:display_index)
    end
    @products = @products.paginate(page: params[:page], per_page: 50).uniq
  end
end
