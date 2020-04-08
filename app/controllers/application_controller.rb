class ApplicationController < ActionController::Base
  include Clearance::Controller
  include Pundit
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  private

  def current_user
    super || Guest.new
  end

  def user_not_authorized
    flash[:warning] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
