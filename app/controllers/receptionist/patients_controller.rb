class Receptionist::PatientsController < Receptionist::BaseController
  include TransactionConcern

  before_action :find_patient, only: [:invoice, :edit, :update, :show, :destroy]

  def index
    @patients = Patient.completed.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def new
    @procedures = Procedure.all
    @patient    = Patient.new
    @patient.patient_procedures.build
  end
  
  def create    
    @patient = Patient.new(patient_params)

    ActiveRecord::Base.transaction do
      if @patient.save
        update_transaction

        redirect_to receptionist_dashboard_index_path
      else
        redirect_to :new
      end
    end
  end

  def edit
    @procedures = @patient.procedures
  end
  
  def update
    if @patient.update!(patient_params)
      update_transaction

      redirect_to receptionist_dashboard_index_path
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
                  Patient.completed.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def search_by_name_and_phone_number
    @patients = Patient.where("name LIKE ? OR phone_number LIKE ?", "%#{params[:search][:seach_query]}%", "%#{params[:search][:seach_query]}%")
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
      :phone_number,
      patient_procedures_attributes: %i[id price procedure_id content receptionist_id user_id _destroy]
    )
  end

  def find_patient
    @patient = Patient.find(params[:id])
  end
end