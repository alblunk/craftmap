class PagesController < ApplicationController
  def landing
    @user = User.new
    render layout: false
  end

  def about; end

  def home
    @products = Product.active_campaigns
    @brands = Brand.where(active: true)
  end

  def faq; end

  def terms; end

  def privacy; end

  def jobs; end

  def upload; end
end
