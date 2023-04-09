class Receptionist::PatientsController < Receptionist::BaseController
  def index
  end

  def new
    @patient    = Patient.new
    # @procedures = Procedure.all
    @patient.patient_procedures.build
    @patient.build_referrer
  end
  
  def create    
    @patient = Patient.new(patient_params)
    if @patient.save
      # @patient.qr_code.attach(io: StringIO.new(png.to_s), filename: "filename.png")
      binding.pry
      redirect_to root_path
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
      referrer_attributes: [:id, :hospital_name, :doctor_name, _destroy]
    )
    # patient_procedure_attributes: %i[id price procedure_id receptionist_id _destroy]
  end
  
  def find_patient
    @patient = Patient.find(params[:id])
  end
end