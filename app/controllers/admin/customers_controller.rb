class Admin::CustomersController < ApplicationController
    before_action :authenticate_admin!

    def index
        @customers = Customer.with_deleted.page(params[:page]).per(20)
    end

    def show
        @customer = Customer.with_deleted.find(params[:id])
        @number = 0
    end

    def edit
        @customer = Customer.with_deleted.find(params[:id])
        @address = @customer.addresses.first
    end

    def update
        @customer = Customer.with_deleted.find(params[:id])
        @address = @customer.addresses.first
        @address.postal_code = params[:customer][:address][:postal_code]
        @address.address = params[:customer][:address][:address]
        if @customer.update(customer_params) && @address.save
          flash[:notice] = "会員情報を編集しました！"
          redirect_to admin_customer_path(@customer)
        else
          render 'edit'
        end
    end

    def destroy
        @customer = Customer.find(params[:id])
        @customer.destroy
        redirect_to admin_customers_path
    end

    private
    def customer_params
        params.require(:customer).permit(:name_last_kanji, :name_first_kanji, :name_last_kana, :name_first_kana, :email, :phone_number, :deleted_at ,addresses_attributes: [:address, :postal_code, :_destroy, :id])
    end
end
