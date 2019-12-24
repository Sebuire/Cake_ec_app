class OrderItemsController < ApplicationController
	before_action :authenticate_customer!
  def show
  	@order_items = OrderItem.all
  end

  def index
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @times = 0
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
