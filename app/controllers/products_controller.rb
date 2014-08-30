class ProductsController < ApplicationController
  def index
    if params[:tag_ids].present?
      @products = Product.joins(:tags).where(tags: {id: params[:tag_ids]})
    else
      @products = Product.all
    end
  end
end
