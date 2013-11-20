class ProductsController < ApplicationController

  before_action :require_admin, except: [ :show ]

  def index
    @products = Product.order("existingline, updated_at desc, created_at desc, active").page(params[:page]).per(250)
  end

  def show
    @product = Product.find(params[:id])
    @brand = @product.brand.id
    @products = Product.active_campaigns.order("RANDOM()").limit(6)
    # @products = Product.active_campaigns.order("updated_at desc").limit(6)
    @brands = Brand.active_brands.order("RANDOM()").limit(4)
  end

  def new
    @product = current_brand.products.build
    @product.build_remote_data
  end

  def edit
    @product = Product.find(params[:id])
    @product.build_remote_data unless @product.remote_data
  end

  def create
    @product = current_brand.products.new(product_params)
    @product.owner = current_user

    if @product.save
      redirect_to [current_brand, @product]
    else
      format.html { render action: "new" }
    end
  end

  # def clone
  #   @product = Product.find(params[:id]) 
  #   @product = Prescription.new(@product.attributes) 
  #   render :new 
  # end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to [current_brand, @product], notice: 'Product was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
    end
  end

  private

    def current_brand
      @brand ||= Brand.find(params[:brand_id])
    end

    def product_params
      params.require(:product).
              permit( :name, :description, :materials, :details, :features, :price, :deliver_date, :percentage, :end_date,
                      :updates, :status, :active, :archived, :usa, :limited, :primary_image,
                      :limitednumber, :existingline, :existingurl, :dimensions, :owner,
                      secondary_images_attributes: [ :image ],
                      remote_data_attributes: [ :slug ],
                      brand_attributes: [ :name, :profile ] )
    end
end
