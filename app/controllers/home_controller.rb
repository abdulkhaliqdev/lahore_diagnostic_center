class HomeController < ApplicationController
  before_action :authenticate_user!, except: %i[index] 
  before_action :find_patient, only: %i[invoice report download_report]
  before_action :find_invoice_procedure, only: %i[report download_report]
  before_action :get_patient_by_case_id_and_patient_id, only: %i[view_report]

  def index; end

  def report
        
  end

  def invoice
    @tests = @patient.patient_procedures
    respond_to do |format|
      format.html
      format.pdf { 
        render template: 'home/invoice', 
               pdf: "#{@patient.name}",
               formats: [:html],
               disposition: :inline,
               layout: 'pdf',
               page_height: '12in',
               page_width: '8in',
               footer:  {   html: {   
                    template:'shared/footer',
                    formats: [:html],
                    layout:  'pdf'
                  }
                }
      }
    end
  end

  def report
    respond_to do |format|
      format.html
      format.pdf {
        render template: 'home/report',
               pdf: "#{@patient.name}",
               formats: [:html],
               disposition: :inline,
               layout: 'pdf',
               page_size: 'Letter',
               footer:  {   html: {   
                            template:'shared/footer',
                            formats: [:html],
                            layout:  'pdf'
                          }
                        }
            }
    end
  end

  def download_report
    # attachment
    respond_to do |format|
      format.pdf {
        render template: 'home/download_report',
          pdf: "#{@patient.name}",
          formats: [:html],
          disposition: :attachment,
          layout: 'pdf',
          page_size: 'Letter',
          footer:  {   
            html: {   
              template:'shared/footer',
              formats: [:html],
              layout:  'pdf'
            }
          }
        }
    end
  end

  def view_report
    unless @patient.present?
      redirect_to :root
    end
  end

  private

  def find_patient
    @patient = Patient.find(params[:id])
  end

  def get_patient_by_case_id_and_patient_id
    @patient = Patient.find_by_case_id_and_patient_id(params[:patient_id], params[:case_id])
  end

  def find_invoice_procedure
    @procedure ||= PatientProcedure.find(params[:test_id])
  end
end
