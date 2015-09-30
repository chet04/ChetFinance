class CreateFinancialAccounts < ActiveRecord::Migration
  def change
    create_table :financial_accounts do |t|
      t.string :name
      t.string :klass
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
