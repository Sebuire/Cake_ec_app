class Admin::OrdersController < ApplicationController
	before_action :authenticate_admin!

	def index
	  	@orders = Order.page(params[:page]).per(10).reverse_order
	end

	def show
		@order = Order.find(params[:id])
		@customer = Customer.with_deleted.find(@order.customer_id)
		@order_items = @order.order_items
		@tax = 10
		@order_items.each do |o|
			@tax_price = o.item.price + o.item.price / @tax
			@tax_price_all = @tax_price * o.quantity
		end
	end

	def edit
		@order = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		@order.customer = Customer.with_deleted.find(@order.customer_id)
		@order.update(order_params)
        redirect_to admin_orders_path
	end

	private
	def order_params
		params.require(:order).permit(:order_status)
	end

end
