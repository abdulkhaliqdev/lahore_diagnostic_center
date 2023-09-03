class Admin::TransactionsController < Admin::BaseController

  def index
    @transactions = Transaction.all
  end

  def calculate_today_income
    @transaction   = Transaction.find_by('DATE(created_at) = ?', DateTime.now)

    if @transaction.present?
      @transaction.update(transaction_params)
    else
      @transaction = Transaction.create(transaction_params)
    end
  end

  def search
    start_date = params[:search][:start_date].to_date
    end_date   = params[:search][:end_date].present? ? params[:search][:end_date].to_date : Date.today
    @transactions = Transaction.where("transaction_date", start_date..end_date)
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
