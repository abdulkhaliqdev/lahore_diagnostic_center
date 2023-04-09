class Admin::ProceduresController < Admin::BaseController
  def index
    @procedures = Procedure.all
  end
end
