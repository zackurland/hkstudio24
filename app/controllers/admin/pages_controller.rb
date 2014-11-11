class Admin::PagesController < AdminController
  before_action :navigation

  def index
    @pages = Page.order(:name)
  end

  def edit
    @page = Page.find(params[:id])
    @editables = @page.editables.order(:id)
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(page_params)
      redirect_to admin_pages_path
    else
      render :edit
    end
  end

  private

  def page_params
    params.require(:page).permit(editables_attributes: [:id, :text])
  end

  def navigation
    @admin_navigation = "pages"
  end

end
