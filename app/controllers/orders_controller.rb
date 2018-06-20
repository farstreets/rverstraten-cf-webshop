class OrdersController < ApplicationController

  def index
    # @orders = Order.all
    @orders = Order.includes(:product).all
  end

  def show
    # redirect_to('www.youtube.com')
    # redirect_to(:controller => 'simple_pages', :action => 'landing_page')
    @order = Order.find(params[:id])
  end

  def new
  end

  def create
  end

  def destroy
  end

end
