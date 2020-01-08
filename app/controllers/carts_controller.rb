class CartsController < ApplicationController
	before_action :authenticate_customer!
  def index
  	@carts = Cart.all
  	@customer = current_customer
    @quantity = [*1..10]
    @total = 0
    @totalPrice = 0
    @newitems = Item.last(3)
    @carts.each do |c|
      @totalPrice += c.item.price * c.quantity
    end
    @totalPriceAll = @totalPrice + @totalPrice / 10
  end

  def create
    @cart = current_customer.carts.new(cart_params)
    cart = Cart.find_by(item_id: @cart.item_id)
    if cart.present? && cart.quantity < 10
       cart.update(quantity: cart.quantity + @cart.quantity)
       redirect_to item_path(cart.item_id)
       flash[:success] = "カートに商品を追加しました。"
    elsif cart.present? && cart.quantity >= 10
       flash[:danger] = "1度の注文の上限は10点です。"
       redirect_to item_path(cart.item_id)
    else
       @cart.save!(cart_params)
       redirect_to item_path(@cart.item_id)
       flash[:success] = "カートに商品を追加しました。"
    end
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.update(cart_params)
    redirect_to carts_path
    flash[:notice] = "数量を変更しました。"
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_path
  end

  def destroy_all
    current_customer.carts.delete_all
    redirect_to carts_path
  end

  private
  def cart_params
  	params.require(:cart).permit(:customer_id, :item_id, :quantity)
  end
end
