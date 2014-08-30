class AdminController < ActionController::Base
  # before you do admin things, you must be an admin...
  # is the user an admin? no? well get the fuck out!
  before_action :authenticate_user!
  before_action :authorize

  def authorize
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
