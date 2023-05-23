class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @products = Product.all

    render json: @products
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  private
    def product_params
      params[:product]
    end
end
