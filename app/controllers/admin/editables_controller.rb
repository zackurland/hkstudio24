class Admin::EditablesController < AdminController
  before_action :navigation

  def index
    @editables = Editable.order(:name)
  end

  def edit
    @editable = Editable.find(params[:id])
  end

  def update
    @editable = Editable.find(params[:id])

    if @editable.update_attributes(editable_params)
      redirect_to admin_editables_path
    else
      render :edit
    end
  end

  private

  def editable_params
    params.require(:editable).permit(:text)
  end

  def navigation
    @admin_navigation = "editables"
  end

end
