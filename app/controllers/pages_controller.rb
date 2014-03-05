class PagesController < ApplicationController
  before_filter :authenticate, only: [ :upload ]

  def landing
    @user = User.new
    render layout: false
  end

  def about; end

  def home
    @products = Product.active_campaigns.order("brand_id ASC, created_at desc")
    @brands = Brand.active_brands.order("name ASC")
  end

  def home_old
    @products = Product.active_campaigns.order("brand_id ASC, created_at asc")
    @brands = Brand.active_brands.order("name ASC")
  end

  def faq; end

  def map; end
  
  def terms; end

  def privacy; end

  def all_brands
    @brands = Brand.active_brands.order("name ASC")
  end

  def all_products
    @products = Product.active_products.order("created_at desc").page(params[:page]).per(48)
  end



  def jobs; end

  def upload; end

  private

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == "brands" && password == "budzo"
      end
    end
end
