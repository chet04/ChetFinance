class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def index
    @transactions = Transaction.order(:account)
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new safe_create_params

    if @transaction.save
      flash[:notice] = "Transaction Created Successfully"
      redirect_to transactions_path
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