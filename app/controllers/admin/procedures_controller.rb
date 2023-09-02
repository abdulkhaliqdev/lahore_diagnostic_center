class Admin::ProceduresController < Admin::BaseController
  before_action :find_procedure, only: %i[edit update destroy show]

  def index
    @procedures = Procedure.order(created_at: :desc)
  end

  def new
    @procedure  = Procedure.new
  end
  
  def create
    @procedure  = Procedure.new(procedure_params)
    if @procedure.save
      flash[:notice] = 'Procedure Created Successfully.'

      redirect_to admin_procedure_path(@procedure)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @procedure.update(procedure_params)
      flash[:notice] = 'Procedure Update Successfully.'

      redirect_to admin_procedure_path(@procedure)
    else
      render :edit
    end
  end

  def show; end

  def destroy
    if @procedure.destroy
      flash[:notice] = 'Procedure Destroy Successfully.'

      redirect_to admin_procedures_path
    end
  end

  private

  def procedure_params
    params.require(:procedure).permit(:procedure_type, :title, :price)
  end
  
  def find_procedure
    @procedure ||= Procedure.find(params[:id])
  end
end
