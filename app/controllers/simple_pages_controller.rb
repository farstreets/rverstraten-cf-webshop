class SimplePagesController < ApplicationController
  def index
  end

  def landing_page
    @featured_product = Product.first
    # @products = Product.all
    @products = Product.limit(5)
  end

end
