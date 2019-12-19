class ChangeColumnToOrderItems < ActiveRecord::Migration[5.2]
  def change
  	change_column :order_items, :making_status, :integer, null: false, default: 0
  end
end
