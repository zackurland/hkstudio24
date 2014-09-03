class ProductsController < ApplicationController
  def index
    @products = Product.joins(:tags)
    @categories = Category.all
    @tag_ids = []
    if params[:filters].present?
      params[:filters].each do |key, value|
        @tag_ids += value
        @products = @products & Product.joins(:tags).where(tags: {id: value})
      end
    end
    @products = @products.uniq
  end
end
