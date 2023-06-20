class Receptionist::BaseController < ApplicationController
  layout 'receptionist'
  before_action :user_authenticate

  private

  def user_authenticate
    redirect_to root_path, alert: 'Unauthorized User!' unless current_user.receptionist?
  end
end