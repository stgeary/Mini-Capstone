class OrdersController < ApplicationController
    def show
        @order = Order.find_by(id: params[:id])
        render :show
    end

    def index
        if current_user
          @orders = current_user.orders
          render :index
        else
          render json: [], status: :unauthorized
        end
      end

    def create
        product = Product.find_by(id: params["product_id"])

        calculated_subtotal = product.price * params["quantity"].to_i
        calculated_tax = calculated_subtotal / 10
        calculated_total = calculated_subtotal + calculated_tax

        @order = current_user.orders.new(
            user_id: params[:user_id],
            product_id: params[:product_id],
            quantity: params[:quantity],
            subtotal: params[:subtotal],
            subtotal: calculated_subtotal,
            tax: calculated_tax,
            total: calculated_total,
        )
        if @order.save
            render :show
        else
            render json: { errors: @order.errors.full_messages},
            status: 22
        end
    end
end
