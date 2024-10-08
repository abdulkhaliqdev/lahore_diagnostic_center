class Typist::PatientsController < Typist::BaseController
  before_action :find_patient, only: [:invoice, :edit, :update, :show, :destroy]

  def index
    @patients    = Patient.completed.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def edit
    @procedures = @patient.procedures
  end
  
  def update
    if @patient.update!(patient_params)
      redirect_to typist_dashboard_index_path
    else
      render :edit
    end
  end
  
  def show
    @test_list = @patient.patient_procedures
  end

  def search
    @patients = params[:search].present? ?
                  Patient.where(patient_id: params[:search][:patient_id], case_id: params[:search][:case_id]).order(created_at: :desc) :
                  Patient.all.order(created_at: :desc)
  end

  def referrer_search
    @patients = Patient.where(referrer_id: params[:search][:referrer_id]).order(created_at: :desc)
  end

  def search_by_name_and_phone_number
    @patients = Patient.where("name LIKE ? OR phone_number LIKE ?", "%#{params[:search][:seach_query]}%", "%#{params[:search][:seach_query]}%")
  end

  def destroy
    if @patient.destroy
      flash[:notice] = 'Patient Deleted Successfully.'

      redirect_to typist_patients_path
    end
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
      :done,
      :phone_number,
      patient_procedures_attributes: %i[id price procedure_id content receptionist_id user_id _destroy]
    )
  end
  
  def find_patient
    @patient ||= Patient.find(params[:id])
  end
end
