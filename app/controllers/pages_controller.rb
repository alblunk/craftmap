class PagesController < ApplicationController
  def home
    @user = User.new
    render layout: false
  end

  def about; end

  def faq; end

  def terms; end

  def privacy; end
end
