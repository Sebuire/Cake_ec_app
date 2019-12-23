class CartsController < ApplicationController
  def index
  	@carts = Cart.all
  	@customer = current_customer
  end

  def create
  end
end
