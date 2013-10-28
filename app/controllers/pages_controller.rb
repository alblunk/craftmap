class PagesController < ApplicationController
  before_filter :authenticate, only: [ :upload ]

  def landing
    @user = User.new
    render layout: false
  end

  def about; end

  def home
    @products = Product.active_campaigns.order("updated_at DESC")
    @brands = Brand.where(active: true).order("name ASC")
  end

  def faq; end

  def terms; end

  def privacy; end

  def jobs; end

  def upload; end

  private

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == "brands" && password == "farallon"
      end
    end
end
