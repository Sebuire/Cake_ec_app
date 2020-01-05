class TopController < ApplicationController
  def top
  	@genres = Genre.all
  	@count = 0
  end

  def about
  end

  def guide
  end

  def thanks
  end
end
