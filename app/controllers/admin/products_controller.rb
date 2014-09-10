class Admin::ProductsController < AdminController
  before_action :navigation

  def index
    @products = Product.order(:name)
  end

  def new
    @product = Product.new
    @product.build_photo
    @categories = Category.all.includes(:tags)
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_product_path(@product)
    else
      @product.build_photo
      @categories = Category.all.includes(:tags)
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all.includes(:tags)
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(product_params)
      redirect_to admin_product_path(@product)
    else
      @categories = Category.all.includes(:tags)
      render :edit
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])

    @product.destroy
    redirect_to :index
  end

  private

  def product_params
    params.require(:product).permit(:name, :dimensions, :price, photo_attributes: [:id, :attachment], tag_ids: [])
  end

  def navigation
    @admin_navigation = "products"
  end
end
