class ChengeColumnToItems < ActiveRecord::Migration[5.2]
  def change
  	change_column :items, :sales_status, :boolean, null:false, default: true
  end
end
