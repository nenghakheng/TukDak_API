class ReceiptItemsController < ApplicationController
  before_action :set_receipt_item, only: [:show, :update, :destroy]

  def index
    @receipt_items = ReceiptItem.all
    render json: @receipt_items
  end

  def show
    render json: @receipt_item
  end

  def create
    @receipt_item = ReceiptItem.new(receipt_item_params)
    if @receipt_item.save
      render json: @receipt_item, status: :created
    else
      render json: @receipt_item.errors, status: :unprocessable_entity
    end
  end

  def update
    if @receipt_item.update(receipt_item_params)
      render json: @receipt_item
    else
      render json: @receipt_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @receipt_item.destroy
    head :no_content
  end

  private

  def set_receipt_item
    @receipt_item = ReceiptItem.find(params[:id])
  end

  def receipt_item_params
    params.require(:receipt_item).permit(:transaction_id, :item_name, :price, :quantity)
  end
end
