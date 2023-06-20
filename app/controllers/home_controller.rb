class HomeController < ApplicationController
  before_action :authenticate_user!, except: %i[index] 
  before_action :find_patient, only: %i[invoice report]

  def index; end

  def report
        
  end

  def invoice
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

  private

  def find_patient
    @patient = Patient.find(params[:id])
  end
end
