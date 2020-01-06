class AdminsController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@orders = Order.all

  	@orderToday = 0
  	@orders.each do |o|
  		if (o.created_at.to_s.match(/#{Date.today.to_s}.+/))
  			@orderToday += 1
  		end
  	end
  end
end
