class Admin::PatientProceduresController < Admin::BaseController
	before_action :find_patient_procedure

  def edit; end

  def update    
    if @patient_procedure.update(patient_params)
      redirect_to admin_patient_path(@patient_procedure.patient)
    else
      redirect_to :new
    end
  end

  private

  def patient_params
    params.require(:patient_procedure).permit(:content, :done)
  end

  def find_patient_procedure
    @patient_procedure ||= PatientProcedure.find(params[:id])
  end
end
