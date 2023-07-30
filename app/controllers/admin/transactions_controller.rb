class Admin::TransactionsController < Admin::BaseController

  def index
    @transactions = Transaction.all
  end

  def calculate_today_income
    @transaction   = Transaction.find_by('DATE(created_at) = ?', Date.today)

    if @transaction.present?
      @transaction.update(transaction_params)
    else
      @transaction = Transaction.create(transaction_params)
    end
  end

  def search
    start_date = params[:start_date]
    end_date   = params[:end_date].present? ? params[:end_date] : Date.today
 
    @transactions = Transaction.where(date_column: params[:start_date]..params[:end_date])

    @total_amount = @transactions.sum(:amount)
  end


  private

  def transaction_params
    {
      amount: Transaction.today_income,
      transaction_date: Date.today
    }
  end
end
