class SuppliersController < ApplicationController
    def suppliers
        @suppliers = Supplier.all
        render :index
    end
    def one_supplier
        @supplier = Supplier.first
        render :show
    end
    def show
        @supplier = supplier.find_by(id: params[:id])
        render :show
    end
    def create
        @supplier = Supplier.create(
            name: params["name"],
            email: params["email"],
            phone_number: params["phone_number"],   
        )
        if @supplier.valid?
            render :show
        else
            render json: { errors: @supplier.errors.full_messages},
            status: 22
        end
    end

    def patch
        @supplier = Supplier.find_by(id: params[:id])
        @supplier.update(
            name: params["name"] || @supplier.name,
            email: params["email"] || @supplier.email,
            phone_number: params["phone_number"] || @supplier.phone_number,
        )
        if @supplier.valid?
            render :show
        else
            render json: { errors: @supplier.errors.full_messages},
            status: 22
        end
    end
    def destroy
        @supplier = Supplier.find_by(id: params[:id])
        @supplier.destroy
        render json: {message: "File has been successfully annihilated"}
    end
end
