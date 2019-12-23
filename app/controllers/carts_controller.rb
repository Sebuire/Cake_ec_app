class CartsController < ApplicationController
	before_action :authenticate_customer!
	before_action :correct_customer
  def index
  	@carts = Cart.all
  	@customer = current_customer
  end

  def create
  end

  private
  def cart_params
  	params.require(:cart).permit(:item_id, :quantity)
  end
  def correct_customer
    @customer = Customer.find(params[:id])
    if current_customer != @customer
    redirect_to current_customer
    else
      current_customer
    end
  end
end
