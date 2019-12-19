class ChangeColumnToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :sales_status, :integer, null: false, default: 0
  end
end
