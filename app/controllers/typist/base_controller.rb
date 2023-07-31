class Typist::BaseController < ApplicationController
  layout 'typist'
  before_action :user_authenticate

  private

  def user_authenticate
    redirect_to root_path, alert: 'Unauthorized User!' unless current_user.typist?
  end
end
