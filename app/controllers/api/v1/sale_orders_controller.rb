module Api
  module V1
    class SaleOrdersController < ApplicationController
      # GET /sale_orders
      # GET /sale_orders.json
      def index
        @sale_orders = SaleOrder.all

        render json: @sale_orders, root: false
      end

      # POST /sale_orders
      # POST /sale_orders.json
      def create
        @sale_order = SaleOrder.new(sale_order_params)

        if @sale_order.save
          render json: @sale_order, status: :created
        else
          render json: { errors: @sale_order.errors.full_messages.to_sentence, code: :validation_error }, status: :unprocessable_entity
        end
      end

      private

      def sale_order_params
        params[:sale_order]
      end
    end
  end
end
