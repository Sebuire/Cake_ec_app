class ItemsController < ApplicationController
  def index
  	@items = Item.page(params[:page]).per(20)
  	@genres = Genre.all
  end

  def show
  	@item = Item.find(params[:id])
  	@cart = Cart.new
  	@quantity = [*1..10]
  end
end
