class SecondaryImagesController < ApplicationController

  before_action :require_admin

  def index
    @product = Product.find(params[:product_id])
    @images = SecondaryImage.where(imageable_id: params[:product_id], imageable_type: "Product")
    @image = @product.secondary_images.build
  end

  def create
    image = SecondaryImage.new(secondary_image_params)

    if image.save
      flash[:notice] = "Image added successfully."
    else
      flash[:error] = "Error saving the image. Try again."
    end

    redirect_to product_secondary_images_path(params[:product_id])
  end

  def destroy
    image = SecondaryImage.find(params[:id])

    if image.destroy
      flash[:notice] = "Image was removed."
    else
      flash[:error] = "Error removing."
    end

    redirect_to product_secondary_images_path(params[:product_id])
  end

  private

    def secondary_image_params
      params.require(:secondary_image).permit(:image, :imageable_id, :imageable_type)
    end

end
