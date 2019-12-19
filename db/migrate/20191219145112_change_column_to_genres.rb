class ChangeColumnToGenres < ActiveRecord::Migration[5.2]
  def change
  	change_column :genres, :is_active, :boolean, null:false, default: true
  end
end
