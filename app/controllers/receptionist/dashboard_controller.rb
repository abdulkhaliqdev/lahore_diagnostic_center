class Receptionist::DashboardController < Receptionist::BaseController
  def index
    @patients    = Patient.all.order(created_at: :desc)
  end
end