class AddressesController < ApplicationController
  def edit
  end

  def update
  end

  def index
  end

  def address_params
      params.require(:address).permit(:address, :postal_code])
  end
end
