class Admin::OrdersController < ApplicationController
	before_action :authenticate_admin!

	def index
	  	@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
		@order.order_items
		@order_item = OrderItem.find(params[:id])


		@total = 0
		@order.order_items.each do |f|
			@total += f.price
		end
	end

	def edit
		@order = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		 if @order.update(order_params)
               redirect_to admin_orders_path
            else
               render :edit
            end
	end

	private
	def order_params
		params.require(:order).permit(:order_status)
	end

end
