class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :entry
      t.string :debit_or_credit
      t.float :amount
      t.string :date
      t.string :account
      t.string :general_ledger
      t.string :revenue_or_expense_or_balancesheet
      t.references :financial_account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
