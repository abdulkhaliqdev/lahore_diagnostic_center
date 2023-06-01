class Admin::PatientsController < Admin::BaseController
  before_action :find_patient, only: [:invoice, :edit, :update, :show]

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
      redirect_to admin_dashboard_index_path
    else
      redirect_to :new
    end
  end

  def edit
    @procedures = Procedure.all
  end
  
  def update    
    if @patient.update(patient_params)
      redirect_to admin_dashboard_index_path
    else
      redirect_to :new
    end
  end
  
  def show
    @procedures = Procedure.all
  end

  def search
    @patients = params[:search].present? ?
                  Patient.where(patient_id: params[:search][:patient_id], case_id: params[:search][:case_id]).order(created_at: :desc) :
                  Patient.all.order(created_at: :desc)
  end

  def destroy
  end

  def invoice
    respond_to do |format|
      format.html
      format.pdf { 
        render template: 'admin/patients/invoice', 
               pdf: "#{@patient.name}",
               formats: [:html],
               disposition: :inline,
               layout: 'pdf',
               options: {
                page_height: 'Letter',
                print_media_type: true
              }
            }
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
      patient_procedures_attributes: %i[id price procedure_id content receptionist_id user_id _destroy]
    )
  end
  
  def find_patient
    @patient = Patient.find(params[:id])
  end
end