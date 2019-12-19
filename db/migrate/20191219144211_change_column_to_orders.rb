class ChangeColumnToOrders < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :payment, :integer, null: false, default: 0
  	change_column :orders, :order_status, :integer, null: false, default: 0
  end
end
