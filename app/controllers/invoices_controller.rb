class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_patient, only: %i[index]

  respond_to :html

  def index
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'Invoices', template: 'invoices/index'
      end
    end
  end

  def show
    respond_to do |format|
      format.pdf do
        render pdf: "Invoice No. #{@patient.id}",
               page_size: 'A4',
               template: "invoices/show",
               layout: "pdf.html",
               orientation: "Landscape",
               lowquality: true,
               zoom: 1,
               dpi: 75
      end
    end
  end

  private

  def find_patient
    @patient ||= scope.where(patient_id: params[:patient_id], case_id: params[:case_id])&.first
  end

  def scope
    ::Patient.all.includes(:patient_procedures)
  end
end
