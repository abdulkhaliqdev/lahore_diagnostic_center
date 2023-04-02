class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    user = User.find_by_email(resource.email)
    if user.present?
      if user.admin?
        admin_dashboard_index_path
      elsif user.receptionist?
        receptionist_dashboard_index_path
      end
    else
      root_path
    end
  end
end
