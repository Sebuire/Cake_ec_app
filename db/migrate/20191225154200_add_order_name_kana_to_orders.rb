class AddOrderNameKanaToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order_name_kana, :string
  end
end
