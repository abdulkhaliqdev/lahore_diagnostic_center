class Receptionist::PatientsController < Receptionist::BaseController
  include TransactionConcern

  before_action :find_patient, only: [:invoice, :edit, :update, :show, :destroy]

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
    @procedures = Procedure.all
  end
  
  def update
    if @patient.update!(patient_params)
      update_transaction

      redirect_to admin_dashboard_index_path
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