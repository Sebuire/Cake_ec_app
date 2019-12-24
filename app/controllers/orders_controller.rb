class OrdersController < ApplicationController
  def new
    session[:postal_code] = params[:address][:postal_code]
    session[:address] = params[:address][:address]
    redirect_to orders_payment_path
  end

  def confirm
  	@order = Order.new
    @order.order_items.build
  end

  def show
    session[:payment] = params[:order][:payment]
    redirect_to order_confirm_path
  end

  def create
    @order = Order.new
    if @order.save(order_params)
      redirect_to orders_path
      current_customer.carts.delete_all
    else
      render :new
    end
  end

  def select_address
  	@customer = current_customer
  end

  def select_payment
  	@order = Order.new
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postage, :order_name, :order_address, :order_postal_code, :total_price, :payment, order_items_attributes: [:item_id, :quantity, :price])
  end

end
