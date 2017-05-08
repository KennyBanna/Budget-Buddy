class BudgetsController < ApplicationController
  
  def new
    @user = User.find(params[:user_id])
    @budget = @user.budgets.build
  end
  
  def create
    @user = User.find(params[:user_id])
    @budget = @user.budgets.build(budget_params)
    if @budget.save
      redirect_to @user
    else
      render :new
    end
  end
  
  private 
    def budget_params
      params.require(:budget).permit(:name)
    end
end