class ProductsController < ApplicationController
  # before_action :authenticate_admin, except: [:index, :show]

  def shop
    @products = Product.all
    render :index
  end

  def index
    @products = Product.all
    render :index
  end

  def one_product
    @product = Product.first
    render :show
  end

  def show
    @product = Product.find_by(id: params[:id])
    render :show
  end

  def create
    @product = Product.create(
      name: params["name"],
      price: params["price"],
      description: params["description"],
    )
    if @product.valid?
      render :show
    else
      render json: { errors: @product.errors.full_messages },
             status: 22
    end
  end

  def patch
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params["name"] || @product.name,
      price: params["price"] || @product.price,
      description: params["description"] || @product.description,
    )
    if @product.valid?
      render :show
    else
      render json: { errors: @product.errors.full_messages },
             status: 22
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: { message: "File has been successfully annihilated" }
  end

  def enter
    puts "Welcome to the glorious shop, please enter new item name"
  end
end
