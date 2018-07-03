class OrdersController < ApplicationController
  # Login required for orders-access
  before_action :authenticate_user!

  def index
    # @orders = Order.all
    @orders = Order.includes(:product).all
  end

  def show
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
