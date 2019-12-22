class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page]).reverse_order
  end

  def show
    @customer = Customer.find(params[:id])
    @number = 0
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if
      @customer.update(customer_params)
      redirect_to admin_customers_path
    else
      render :edit
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to admin_customers_path
  end

  private
  def customer_params
  params.require(:customer).permit(:deleted_at)

  end
end
