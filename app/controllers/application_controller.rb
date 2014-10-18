class ApplicationController < ActionController::Base
  include CartManager
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # if user is logged in, return current_user, else return guest_user
  def current_or_guest_user
    if current_user
      current_user
    else
      guest_user
    end
  end

  # find guest_user object associated with the current session,
  # creating one as needed
  def guest_user
    @cached_guest_user ||= temp_guest_user
  end

  private

  # called (once) when the user logs in, insert any code your application needs
  # to hand off from guest_user to current_user.
  def logging_in
    # For example:
    # guest_comments = guest_user.comments.all
    # guest_comments.each do |comment|
      # comment.user_id = current_user.id
      # comment.save!
    # end
  end

  def temp_guest_user
    User.new(first_name: "guest", last_name: "user", email: "guest_#{Time.now.to_i}#{rand(100)}@example.com")
  end
end
