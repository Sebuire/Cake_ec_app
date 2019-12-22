class CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :correct_customer, only: [:show, :edit, :update]

  def index
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
    @times = 0
  end

  def update
    @customer = Customer.find(params[:id])
    # @customer.addresses.build(
    #   address: params[:customer][:address][:address],
    #   postal_code: params[:customer][:address][:postal_code]
    #   )
    if @customer.update(customers_params)
      redirect_to customer_path(@customer)
    else
      @customer =Customer.all
      render :edit
    end

  end

  def destroy
    @customer = Customer.find(params[:id])
    if @customer == current_customer
      if @customer.destroy
         redirect_to root_path
      end
    end
  end

  private
  def customers_params
    params.require(:customer).permit(:name_first_kanji, :name_last_kanji,:name_first_kanji_kana, :name_last_kana, :email, :password, :phone_number, :deleted_at,
      addresses_attributes: [:postal_code, :address, :_destroy, :id])
  end
  def correct_customer
    @customer = Customer.find(params[:id])
    if current_customer != @customer
    redirect_to current_customer
    else
      current_customer
    end
  end
end
