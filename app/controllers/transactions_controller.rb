class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def edit

  end

  def index

  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = current_user.transactions.build safe_create_params

    if @transaction.save
      flash[:notice] = "Transaction Created Successfully"
      redirect_to transaction_path(@transaction)
    else
      flash.now[:alert] = @transaction.errors.first
      render 'new'
    end
  end

  def show
    @transaction = Transaction.find params[:id]
  end

  private

  def safe_create_params
    params.require(:transaction).permit(:amount, :date, :account, :general_ledger, :revenue_or_expense_or_balancesheet, :financial_account_id)
  end
end