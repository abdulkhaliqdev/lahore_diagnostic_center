class Receptionist::ReferrersController < Receptionist::BaseController
  before_action :find_referrer, only: %i[edit update destroy show]

  def index
    @referrers = Referrer.all.order(id: :desc)
  end

  def new
    @referrer  = Referrer.new
  end
  
  def create
    @referrer  = Referrer.new(referrer_params)

    if @referrer.save!
      flash[:notice] = 'Referrer Created Successfully.'

      redirect_to receptionist_referrers_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @referrer.update
      flash[:notice] = 'Referrer Update Successfully.'

      redirect_to receptionist_referrers_path
    else
      render :edit
    end
  end

  def show; end

  def destroy
    if @referrer.destroy
      flash[:notice] = 'Referrer Destroy Successfully.'

      redirect_to receptionist_referrers_path
    end
  end

  private

  def referrer_params
    params.require(:referrer).permit(:doctor_name, :hospital_name)
  end
  
  def find_referrer
    @referrer ||= Referrer.find(params[:id])
  end
end