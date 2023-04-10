class Receptionist::PatientsController < Receptionist::BaseController
  def index
  end

  def new
    @patient    = Patient.new
    @patient.patient_procedures.build
    @procedures = Procedure.all
  end
  
  def create    
    @patient = Patient.new(patient_params)
    if @patient.save
      @patient.update(qr_code: @patient.qr_generate.to_s)

      redirect_to receptionist_dashboard_index_path
    else
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def patient_params
    params.require(:patient).permit(
      :name, 
      :father_husband, 
      :gender, 
      :age, 
      :address,
      :referrer_id,
      patient_procedures_attributes: %i[id price procedure_id receptionist_id user_id _destroy]
    )
  end
  
  def find_patient
    @patient = Patient.find(params[:id])
  end
end