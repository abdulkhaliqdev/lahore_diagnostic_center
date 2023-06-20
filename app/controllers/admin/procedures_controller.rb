class Admin::ProceduresController < Admin::BaseController
  def index
    @procedures = Procedure.all
  end

  def new
    @procedure  = Procedure.new
  end
  
  def create
    @procedure  = Procedure.new(referrer_params)
    if @procedure.save
      flash[:notice] = 'Procedure Created Successfully.'

      redirect_to admin_referrers_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @procedure.save
      flash[:notice] = 'Procedure Update Successfully.'

      redirect_to admin_referrers_path
    else
      render :edit
    end
  end

  def show; end

  def destroy
    if @procedure.save
      flash[:notice] = 'Procedure Destroy Successfully.'

      redirect_to admin_referrers_path
    end
  end

  private

  def referrer_params
    params.require(:procedure).permit(:doctor_name, :hospital_name)
  end
  
  def find_referrer
    @procedure ||= Procedure.find(params[:id])
  end
end
