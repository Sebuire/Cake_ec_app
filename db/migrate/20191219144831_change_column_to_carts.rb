class ChangeColumnToCarts < ActiveRecord::Migration[5.2]
  def change
  	change_column :carts, :quantity, :integer, null: false, default: 1
  end
end
