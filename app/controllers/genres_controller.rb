class GenresController < ApplicationController
  def show
  	@genre = Genre.find(params[:id])
  	@items = Item.all
  	@genre.items
  	@genres = Genre.all
  end
end
