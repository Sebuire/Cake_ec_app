class OrderItemsController < ApplicationController
	before_action :authenticate_customer!
	before_action :correct_customer, only: [:show]
  def show
  	@order_items = OrderItem.all
  end

  private
  def correct_customer
    @customer = Customer.find(params[:id])
    if current_customer != @customer
    redirect_to current_customer
    else
      current_customer
    end
  end
end
