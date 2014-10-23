class Admin::AgreementsController < AdminController
  before_action :navigation

  def index
    @agreements = Agreement.order(:duration_weeks)
  end

  def show
    @agreement = Agreement.find(params[:id])
  end

  def edit
    @agreement = Agreement.find(params[:id])
    @agreement.build_pdf
  end

  def update
    @agreement = Agreement.find(params[:id])

    if @agreement.update_attributes(agreement_params)
      redirect_to admin_agreement_path(@agreement)
    else
      render :edit
    end
  end

  private

  def agreement_params
    params.require(:agreement).permit(pdf_attributes: [:id, :attachment])
  end

  def navigation
    @admin_navigation = "agreements"
  end

end
