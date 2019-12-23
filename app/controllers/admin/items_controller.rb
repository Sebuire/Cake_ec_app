class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.page(params[:page]).reverse_order
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品を追加しました！"
      redirect_to admin_item_path(@item.id)
    else
      @genres = Genre.all
      render 'new'
    end
  end
  # error 出る

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品を編集しました！"
      redirect_to admin_item_path
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "商品を削除しました！"
    redirect_to admin_items_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :body, :image, :price, :sales_status, :genre_id)
  end
end
