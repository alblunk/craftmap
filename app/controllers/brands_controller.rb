class BrandsController < ApplicationController
  before_action :require_admin, except: [ :show ]

  def index
    @brands = Brand.order("created_at desc").page(params[:page]).per(25)
  end

  def show
    @brand = Brand.find(params[:id])
  end

  def new
    @brand = Brand.new
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

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy

    respond_to do |format|
      format.html { redirect_to brands_url }
      format.json { head :no_content }
    end
  end

  private

    # TODO may be missing something here to set owner_id
    def brand_params
      params.require(:brand).permit(:name, :profile, :location, :owner, :facebook, :twitter, :instagram, :tumblr, :home_page, :active, image_attributes: [:id, :image, :imageable_id, :imageable_type, :_destroy])
    end

end