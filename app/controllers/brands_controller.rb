class BrandsController < ApplicationController
  before_action :require_admin, except: [ :show ]

  def index
    @brands = Brand.order("active desc, name ASC").page(params[:page]).per(100)
    @products = Product.order("created_at desc")

  end

  def show
    @brand = Brand.find(params[:id])
    # @products = Product.order("created_at ASC") < Doesnt do anything.
    @brands = Brand.active_brands.order("RANDOM()").limit(4)
  end

  def new
    @brand = Brand.new
    @brand.build_profile_image
  end

  def create
    @brand = Brand.new(brand_params)
    @brand.owner = current_user

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
      params.require(:brand).permit(:name, :profile, :city, :state, :zip, :street, :untappd, :ratebeer, :beeradvocate, :owner, :founders, :main_contact, :current_notes, 
                                    :facebook, :twitter, :instagram, :tumblr, :vid_vimeo, :vid_youtube,
                                    :home_page, :active, :logo,
                                    profile_image_attributes: [ :image ])
    end

end