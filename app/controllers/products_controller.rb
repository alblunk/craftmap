class ProductsController < ApplicationController

  before_action :require_admin, except: [ :show ]

  def index
    @products = Product.order("created_at desc").page(params[:page]).per(50)
  end

  def show
    @product = Product.find(params[:id])
    @brand = @product.brand.id
    @products = Product.order("created_at DESC").limit(6)
    @brands = Brand.order("created_at DESC").limit(4)
  end

  def new
    @product = current_brand.products.build
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = current_brand.products.new(product_params)
    @product.owner = current_user

    if @product.save
      redirect_to [current_brand, @product]
    else
      # (8 - @product.images.size).times { @product.images.build }
      format.html { render action: "new" }
    end
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to [current_brand, @product], notice: 'Product was successfully updated.' }
      else
        @product.images.build if @product.images.empty?
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @product = current_brand.products.find(params[:id])
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
              permit( :name, :description, :materials, :details, :features, :price, :deliver_date,
                      :updates, :status, :active, :archived, :usa, :limited,
                      :limitednumber, :existingline, :existingurl, :dimensions, :owner,
                      :primary_image, secondary_images_attributes: [ :image ],
                      brand_attributes: [ :name, :profile ] )
    end
end
