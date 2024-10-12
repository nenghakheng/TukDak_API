# app/controllers/transactions_controller.rb
class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :update, :destroy]

  # GET /transactions
  def index
    @transactions = Transaction.includes(:receipt_items).all
    render json: @transactions.to_json(include: [:receipt_items], methods: [:total_amount])
  end

  # GET /transactions/:id
  def show
    render json: @transaction.to_json(include: [:receipt_items], methods: [:total_amount])
  end

  # POST /transactions
  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      render json: @transaction, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transactions/:id
  def update
    if @transaction.update(transaction_params)
      render json: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transactions/:id
  def destroy
    @transaction.destroy
    head :no_content
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:budget_id, :category_id, :amount, :note)
  end
end
