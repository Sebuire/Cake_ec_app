class CartsController < ApplicationController
	before_action :authenticate_customer!
  def index
  	@carts = Cart.all
  	@customer = current_customer
  end

  def create
    @cart = current_customer.carts.new(cart_params)
    cart = Cart.find_by(item_id: @cart.item_id)
    if cart.present? &&  @cart.quantity > 0
       cart.update(quantity: cart.quantity + @cart.quantity)
       redirect_to item_path(cart.item_id)
       flash[:success] = "カートに商品を追加しました。"
    elsif @cart.quantity > 0
      @cart.save!(cart_params)
      redirect_to item_path(@cart.item_id)
      flash[:success] = "カートに商品を追加しました。"
    end
  end

  def destroy
    current_customer.carts.delete_all
    redirect_to carts_path
  end

  private
  def cart_params
  	params.require(:cart).permit(:customer_id, :item_id, :quantity)
  end
end
