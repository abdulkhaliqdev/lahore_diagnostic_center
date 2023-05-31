class Receptionist::DashboardController < Receptionist::BaseController
  def index
    @patients = Patient.uncompleted.order(created_at: :desc)
  end
end
