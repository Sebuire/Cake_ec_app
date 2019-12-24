class OrdersController < ApplicationController
  def new
  end

  def confirm
  	session[:payment] = params[:order][:payment]
  	@order = Order.new
  end

  def create
  end

  def select_address
  	@customer = current_customer
  end

  def select_payment
  	session[:postal_code] = params[:address][:postal_code]
  	session[:address] = params[:address][:address]
  	@order = Order.new
  end

end
