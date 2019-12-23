class ItemsController < ApplicationController
  def index
  end

  def show
  	@item = Item.find(params[:id])
  	@cart = Cart.new
  end
end
