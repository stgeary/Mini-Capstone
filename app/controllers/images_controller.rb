class ImagesController < ApplicationController
    def images
        @images = Image.all
        render :index
    end
    def one_image
        @image = Image.first
        render :show
    end
    def show
        @image = Image.find_by(id: params[:id])
        render :show
    end
    def create
        @image = Image.create(
            url: params["url"],
            productid: params["productid"],
            
        )
        if @image.valid?
            render :show
        else
            render json: { errors: @image.errors.full_messages},
            status: 22
        end
    end

    def patch
        @image = Image.find_by(id: params[:id])
        @image.update(
            url: params["url"] || @image.url,
            productid: params["productid"] || @image.productid,
            
        )
        if @image.valid?
            render :show
        else
            render json: { errors: @image.errors.full_messages},
            status: 22
        end
    end
    def destroy
        @image = Image.find_by(id: params[:id])
        @image.destroy
        render json: {message: "File has been successfully annihilated"}
    end
end
