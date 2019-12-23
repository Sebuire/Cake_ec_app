class AddressesController < ApplicationController
  def edit
  	@address = Address.find(params[:id])
  end

  def update
  	@address = Address.find(params[:id])
  	if @address.update(address_params)
  		redirect_to customer_path(current_customer)
  	else
  		render :edit
  	end
  end

  def index
  end

  def address_params
      params.require(:address).permit(:address, :postal_code)
  end
end
