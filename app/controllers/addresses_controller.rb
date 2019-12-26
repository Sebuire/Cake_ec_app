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
    @customer = current_customer
    @addresses = @customer.addresses
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "住所を追加しました！"
      redirect_to addresses_path
    else
      render 'new'
    end
  end

private
  def address_params
      params.require(:address).permit(:address, :postal_code, :customer_id)
  end
end
