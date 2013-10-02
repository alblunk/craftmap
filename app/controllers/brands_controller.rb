class BrandsController < ApplicationController
  before_action :require_admin, except: [ :index, :show ]

  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find(params[:id])
  end

  def new
    @brand = Brand.new
    # @image = @brand.images.build
  end

  def create
    @brand = Brand.new(brand_params)
    @image = @brand.images.build
    @brand.owner = current_user
    @image.image = params[:brand][:image][:image]

    if @brand.save
      redirect_to @brand
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])

    if @brand.update(brand_params)
      redirect_to @brand
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

    # TODO may be missing something here to set owner_id
    def brand_params
      params.require(:brand).permit(:name, :profile, :location, :owner, image_attributes: [:id, :image, :imageable_id, :imageable_type, :_destroy])
    end

end