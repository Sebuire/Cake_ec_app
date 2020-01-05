class ItemsController < ApplicationController
  def index
  	@genres = Genre.all
    @items = Item.search(params[:search])

    @activeItem = 0
    @genres.each do |g|
      if g.is_active == true
        @activeItem += g.items.count
      end
    end
  end

  def show
  	@item = Item.find(params[:id])
  	@genres = Genre.all
  	@cart = Cart.new
  	@quantity = [*1..10]
  end
end
