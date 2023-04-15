class Receptionist::PatientsController < Receptionist::BaseController
  def index
    @patients    = Patient.all.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'Invoices'
      end
    end
  end

  def new
    @procedures = Procedure.all
    @patient    = Patient.new
    @patient.patient_procedures.build
  end
  
  def create    
    @patient = Patient.new(patient_params)
    if @patient.save
      binding.pry
      @patient.update(image: @patient.qr_generate.to_s)

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

  def invoice
    render pdf: "invoice", template: "receptionist/patients/invoice.html.erb", formats: :pdf
    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     render pdf: "file_name", template: "receptionist/patients/invoice.html.erb"
    #   end
    # end
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