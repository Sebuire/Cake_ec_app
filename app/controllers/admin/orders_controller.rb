class Admin::OrdersController < ApplicationController
	before_action :authenticate_admin!

	def index
	  	@orders = Order.page(params[:page]).per(10).reverse_order
	end

	def show
		@order = Order.find(params[:id])
		@order.order_items
		@count = 0

		@tax = 10
		@tax_price = 0
		@tax_price_all = 0
		@order.order_items.each do |t|
			@tax_price = t.item.price * t.quantity / @tax
			@tax_price_all += @tax_price
		end

		@item_total_price = 0
			@order.order_items.each do |f|
			@item_total_price = f.price * f.quantity + f.price * f.quantity / 10
		end

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
