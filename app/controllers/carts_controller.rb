class CartsController < ApplicationController
	before_action :authenticate_customer!
  def index
  	@carts = Cart.all
  	@customer = current_customer
  end

  def create
    @cart = Cart.new(cart_params)
    if @cart.quantity > 0
      @cart.save!(cart_params)
      redirect_to carts_path
    end
  end

  private
  def cart_params
  	params.require(:cart).permit(:customer_id, :item_id, :quantity)
  end
end
