class GenresController < ApplicationController
  def show
  	@items = Item.all
  	@genre = Genre.find(params[:id])
  	@genre.items
  end
end
