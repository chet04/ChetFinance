class Transaction < ActiveRecord::Base
  belongs_to :financial_account
end
