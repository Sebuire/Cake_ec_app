class ItemsController < ApplicationController
  def index
  end

  def show
  	@item = Item.find(params[:id])
  	@cart = Cart.new
  	@quantity = [*1..10]
  end
end
