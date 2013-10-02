class PagesController < ApplicationController
  def landing
    @user = User.new
    render layout: false
  end

  def home
    @products = Product.all
    @brands = Brand.all
  end

  def about
  end

  def faq
  end
  
  def terms
  end

  def privacy
  end
end
