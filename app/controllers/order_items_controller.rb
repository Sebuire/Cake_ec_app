class OrderItemsController < ApplicationController

	before_action :authenticate_customer!
  def show
  	@order_items = OrderItem.all
  end
end
