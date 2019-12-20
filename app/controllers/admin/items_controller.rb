class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
  end

  def create
    @item = Item.new(item_params)
    @item = Item.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :body, :image_id, :price, :sales_status)
  end
end
