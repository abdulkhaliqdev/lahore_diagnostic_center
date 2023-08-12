module TransactionConcern
  extend ActiveSupport::Concern

  included do
    def update_transaction
      if transaction.present?
        transaction.update(transaction_params)
      else
        Transaction.create(transaction_params)
      end
    end
  end


  private

  def transaction_params
    {
      amount: Transaction.today_income,
      transaction_date: Date.today
    }
  end

  def transaction
    @transaction ||= Transaction.find_by('DATE(created_at) = ?', Date.today)
  end
end
