class OrderItemsController < ApplicationController
	before_action :authenticate_customer!
  def show
  	@order = Order.find(params[:id])
    @order_items = @order.order_items
    @item_price = 0
    @tax = 10
    @order_items.each do |o|
      @item_price += o.item.price * o.quantity + o.item.price  * o.quantity / 10
    end
  end

  # private
  # def correct_customer
  #   @customer = Customer.with_deleted.find(params[:id])
  #   if current_customer != @customer
  #   redirect_to current_customer
  #   else
  #     current_customer
  #   end
  # end

  def order_item_params
    params.require(:order_item).permit(:order_id, :item_id, :quantity, :price)
  end
end
