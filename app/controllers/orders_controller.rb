class OrdersController < ApplicationController
    def show
        @order = Order.find_by(id: params[:id])
        render :show
    end

    def index
        orders = Order.all.order(:id)
        render json: orders
    end

    def create
        @order = Order.create(
            user_id: params["user_id"],
            product_id: params["product_id"],
            quantity: params["quantity"],
            # subtotal: params,
            # tax: params["tax"],
            # total: params["total"]
        )
        if @order.valid?
            render :show
        else
            render json: { errors: @order.errors.full_messages},
            status: 22
        end
    end
end
