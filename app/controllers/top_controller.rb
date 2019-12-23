class TopController < ApplicationController
  def top
  	@genres = Genre.all
  end

  def about
  end

  def guide
  end
end
