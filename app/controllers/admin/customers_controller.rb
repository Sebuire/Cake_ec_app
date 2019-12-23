class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.with_deleted.page(params[:page]).per(20)
  end

  def show
    @customer = Customer.with_deleted.find(params[:id])
    @number = 0
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
