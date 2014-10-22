class AdminController < ActionController::Base
  # before you do admin things, you must be an admin...
  # is the user an admin? no? well get the fuck out!
  before_action :authenticate_user!
  before_action :authorize

  def authorize
    unless current_user.admin?
      sign_out current_user
      redirect_to new_user_session_path
    end
  end
end
