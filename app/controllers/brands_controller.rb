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
    @image = Image.new
  end

  def create
    @brand = Brand.new(brand_params)
    @brand.owner = current_user
    @image = Image.new(imageable_type: 'brand')

    if @brand.save
      @image.imageable_id = @brand.id
      debugger

      # @image.file =
      @image.save(params[:image])
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
      params.require(:brand).permit(:name, :profile, :location, :owner,  images_attributes: [:imageable_type, :imageable_id, :file])
    end

end