class Admin::ProductsController < AdminController
  before_action :navigation

  def index
    if params[:query].present?
      @products = Product.where("lower(name) = ?", params[:query].downcase).paginate(page: params[:page], per_page: 100).order(:display_index)
    else
      @products = Product.paginate(page: params[:page], per_page: 100).order(:display_index)
    end
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

  def reorder
    offset = params[:page] ? (params[:page].to_i - 1) * 20 : 0
    params[:sortable].each_with_index do |id, index|
      Product.find(id).update_column(:display_index, index + offset + 1)
    end

    render json: true
  end

  private

  def product_params
    params.require(:product).permit(:active, :name, :dimensions, :production_rental_price, :short_rental_price, :display_index, photo_attributes: [:id, :attachment], tag_ids: [])
  end

  def navigation
    @admin_navigation = "products"
  end
end
