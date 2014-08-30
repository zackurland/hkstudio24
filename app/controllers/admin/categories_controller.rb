class Admin::CategoriesController < AdminController
  before_action :navigation

  def index
    @categories = Category.order(:name)
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
    @category.tags.build
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_category_path(@category)
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(category_params)
      redirect_to admin_category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])

    @category.destroy
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, tags_attributes: [:id, :name])
  end

  def navigation
    @admin_navigation = "categories"
  end
end
