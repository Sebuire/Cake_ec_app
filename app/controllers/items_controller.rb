class ItemsController < ApplicationController
  def index
  	@genres = Genre.all
    @items = Item.search(params[:search])
  end

  def show
  	@item = Item.find(params[:id])
  	@genres = Genre.all
  	@cart = Cart.new
  	@quantity = [*1..10]
  end
end
