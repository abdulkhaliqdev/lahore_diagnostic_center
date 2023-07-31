class Typist::DashboardController < Typist::BaseController
  def index
    @patients = Patient.uncompleted.order(created_at: :asc)
  end
end