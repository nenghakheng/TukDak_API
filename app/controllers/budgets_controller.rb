class BudgetsController < ApplicationController
  before_action :set_budget, only: [:show, :update, :destroy]

  # GET /budgets
  def index
    @budgets =  Budget.includes(:categories, :transactions).all
    render json: @budgets.to_json(include: [:categories, :transactions])
  end

  # GET /budgets/:id
  def show
    render json: @budget
  end

  # POST /budgets
  def create
    @budget = Budget.new(budget_params)
    @budget.user_id = budget_params[:user_id]

    if @budget.save
      render json: @budget, status: :created
    else
      render json: @budget.errors, status: :unprocessable_entity
    end
  end

  # PUT /budgets/:id
  def update
    if @budget.update(budget_params)
      render json: @budget
    else
      render json: @budget.errors, status: :unprocessable_entity
    end
  end

  # DELETE /budgets/:id
  def destroy
    @budget.destroy
    head :no_content
  end

  private

  # Find the budget before show, update, and destroy actions
  def set_budget
    @budget = Budget.find(params[:id])
  end

  # Strong parameters for budget
  def budget_params
    params.require(:budget).permit(:user_id, :title, :currency)
  end
end
