class FinancialAccountsController < ApplicationController
  before_action :authenticate_user!

  def edit

  end

  def index

  end

  def new
    @financial_account = FinancialAccount.new
  end

  def create
    @financial_account = FinancialAccount.new safe_create_params

    if @financial_account.save
      flash[:notice] = "Financial Account Created Successfully"
      redirect_to financial_account_path(@financial_account)
    else
      flash.now[:alert] = @financial_account.errors.first
      render 'new'
    end
  end

  def show
    @financial_account = FinancialAccount.find params[:id]
  end

  private

  def safe_create_params
    params.require(:financial_account).permit(:name, :klass)
  end
end
