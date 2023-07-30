class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount, default: 0.0
      t.date :transaction_date

      t.timestamps
    end
  end
end
