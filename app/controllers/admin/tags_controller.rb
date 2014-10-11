class Admin::TagsController < AdminController
  def reorder
    params[:sortable].each_with_index do |id, index|
      Tag.find(id).update_column(:display_index, index + 1)
    end

    render json: true
  end
end
