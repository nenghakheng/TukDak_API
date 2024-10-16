# app/controllers/categories_controller.rb
class CategoriesController < ApplicationController
  # GET /categories
  def index
    @categories = Category.includes(:transactions).all
    render json: @categories.to_json(include: [:transactions])
  end

  # GET /categories/:id
  def show
    @category = Category.find(params[:id])
    render json: @category
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/:id
  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/:id
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    head :no_content
  end

  private

  # Strong parameters for category
  def category_params
    params.require(:category).permit(:budget_id, :title, :icon, :tx_type)
  end
end
