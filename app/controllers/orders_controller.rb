class OrdersController < ApplicationController
  before_action :authenticate_customer!
  def select_address
    @customer = current_customer
  end

  def new
    session[:name_kanji] = (params[:customer][:name_last_kanji] + params[:customer][:name_first_kanji])
    session[:name_kana] = (params[:customer][:name_last_kana] + params[:customer][:name_first_kana])
    session[:address] = Address.find(params[:customer][:address_id])[:address]
    session[:postal_code] = Address.find(params[:customer][:address_id])[:postal_code]
    redirect_to orders_payment_path
  end

  def select_payment
    @order = Order.new
  end

  def show
    session[:payment] = params[:order][:payment]
    redirect_to order_confirm_path
  end

  def confirm
  	@order = Order.new
    @order.order_items.build

    @times = 0
    @postage = 800
    @tax = 10
    @total = 0
    @total_all = 0
    @paymoney = 0
    current_customer.carts.each do |p|
      @total += p.item.price * p.quantity
      @total_all = @total + @total / @tax
    end
    @paymoney = @total_all + @postage
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      current_customer.carts.delete_all
      session[:name_kanji] = nil
      session[:name_kana] = nil
      session[:address] = nil
      session[:postal_code] = nil
      session[:payment] = nil
      redirect_to customer_path(current_customer)
    else
      render :new
    end
  end

  def index
    @customer = current_customer
    @orders = @customer.orders
  end


  private
  def order_params
    params.require(:order).permit(:customer_id, :postage, :order_name, :order_name_kana, :order_address, :order_postal_code, :total_price, :payment, order_items_attributes: [:item_id, :quantity, :price])
  end

end
