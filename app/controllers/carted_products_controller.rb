class CartedProductsController < ApplicationController
  def index
    @carted_product = CartedProduct.all
    render :index
  end

  def create
    @carted_product = CartedProduct.create(
      product_id: params["product_id"],
      user_id: params["user_id"],
      quantity: params["quantity"],
      order_id: params["order_id"],
      status: "In cart",
    )
  end
end
